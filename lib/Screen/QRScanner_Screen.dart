import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:paytm_demo/Db_Helper/Transaction_Db_Helper.dart';
import 'package:paytm_demo/Model/Transaction_Model.dart';
import 'package:paytm_demo/Screen/Successful_Transaction_Screen.dart';
import 'package:paytm_demo/Units/strings.dart';
import 'package:paytm_demo/Widgets/TextUnit.dart';

class QRScanner_Screen extends StatefulWidget {
  final String number;

  QRScanner_Screen({this.number});

  @override
  _QRScanner_ScreenState createState() => _QRScanner_ScreenState();
}

class _QRScanner_ScreenState extends State<QRScanner_Screen> {
  var dbHelper;
  String transactionStatus = strings.firstScan;
  var randomNumber = new Random();
  String transactionTime =
  DateFormat('kk:mm:ss \t EEE d MMM').format(DateTime.now());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = Trasaction_DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 5,
              backgroundColor: Colors.white,
              title: CustomText(
                text: 'Scan QR Code',
                color: Colors.blue[900],
              ),
              centerTitle: true,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.blue[900],
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  }),
            ),
            backgroundColor: Colors.white,
            body: mainLayout(),
          )),
    );
  }

  Widget mainLayout() {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            qrImage(),
            SizedBox(
              height: 15,
            ),
            scanText(),
            SizedBox(
              height: 30,
            ),
            scanButtonImage(),
            SizedBox(
              height: 10,
            ),
            tapText(),
            SizedBox(
              height: 20,
            ),
            scanId(),
            SizedBox(
              height: 20,
            ),
            proccedTransactionButton(),
            SizedBox(
              height: 20,
            ),
          ],
        )
      ],
    );
  }

  Widget qrImage() {
    return Container(
      height: 150,
      width: 150,
      color: Colors.white,
      child: Image.asset(
        'assets/qrcode.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget scanText() {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: strings.payScan,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 26,
                  color: Colors.black)),
          TextSpan(
            text: strings.paytm,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: Colors.blue[900],
            ),
          ),
        ],
      ),
    );
  }

  Widget scanButtonImage() {
    return InkWell(
      onTap: scanQR,
      child: Image.asset(
        'assets/scanQR.png',
        height: 170,
        width: 170,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget tapText() {
    return CustomText(
      text: strings.plzTapOnQrCode,
      color: Colors.red,
      FontSize: 20,
      FontWeights: FontWeight.w500,
    );
  }

  Widget scanId() {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: strings.transactionId,
              style: TextStyle(fontSize: 18, color: Colors.black)),
          TextSpan(
            text: transactionStatus == "-1"
                ? strings.firstScan
                : transactionStatus,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
        ],
      ),
    );
  }

  Widget proccedTransactionButton() {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: proceedToTransaction,
        child: Container(
          height: 50,
          width: 340,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_open,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: strings.proceedTransaction,
                FontSize: 20,
                FontWeights: FontWeight.bold,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(
          () {
        transactionStatus = barcodeScanRes;
      },
    );
  }

  proceedToTransaction() {
    if (transactionStatus != null &&
        transactionStatus != "-1" &&
        transactionStatus != strings.firstScan) {
      //Create Random Id
      double randomId = randomNumber.nextDouble() * 10000000000;
      String transactionId =
      int.tryParse(randomId.toString().split('.')[0]).toString();
      print('Id:$randomId');

      //Create Random Money
      double randomMoney = randomNumber.nextDouble() * 100000;
      String transactionMoney =
      int.tryParse(randomMoney.toString().split('.')[0]).toString();
      print('Money:$transactionMoney');

      //Current Date And Time

      if (transactionId != null && transactionMoney != null) {
        Transactions data = Transactions(null, widget.number, transactionId,
            transactionMoney, transactionTime);
        dbHelper.save(data);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Successful_Screen()));
      }
    }else {
      failAlert(context);
    }
  }

  Future<void> failAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText(
            text: strings.firstScan,
            FontSize: 16,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
