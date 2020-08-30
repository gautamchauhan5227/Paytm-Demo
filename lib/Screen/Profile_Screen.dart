import 'package:flutter/material.dart';
import 'package:paytm_demo/Screen/Login_Screen.dart';
import 'package:paytm_demo/Widgets/TextUnit.dart';
import 'package:paytm_demo/Units/strings.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile_Screen extends StatefulWidget {
  final String number,name;

  Profile_Screen({this.number,this.name});
  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  GlobalKey globalKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      child: SafeArea(
        bottom: false,
          child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 5,
          actions: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: CustomText(
                  text: strings.editProfile,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ],
        ),
        body: mainLayout(),
      )),
    );
  }

  Widget mainLayout() {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            qrGenerate(),
            SizedBox(height: 20,),
            askKYCText(),
            SizedBox(height: 10,),
            numberText(),
            kycPending(),
            SizedBox(height: 15,),
            shareQRText(),
            paymentsetting(),
            Divider(),
            securtitysetting(),
            Divider(),
            notifySetting(),
            Divider(),
            paymentReminder(),
            Divider(),
            savedAddres(),
            Divider(),
            chatSetting(),
            Divider(),
            logoutButton(),
            version(),
          ],
        )
      ],
    );
  }

  Widget qrGenerate(){
    return Center(
      child: RepaintBoundary(
        key: globalKey,
        child: QrImage(
          gapless: true,
          data: widget.name,
          version: QrVersions.min,
          size: 300.0,
        ),
      ),
    );
  }

  Widget askKYCText(){
    return Center(
      child: CustomText(text: strings.askToScan,color: Colors.blueGrey,),
    );
  }

  Widget numberText(){
    return CustomText(text: widget.number, FontWeights: FontWeight.w900,FontSize: 30,);
  }
  
  Widget kycPending(){
    return OutlineButton.icon(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.grey[400])
        ),
        onPressed: null,
        icon: Icon(Icons.error,color: Colors.yellow[900],),
        label: CustomText(text: 'Kyc Pending')
    );
  }

  Widget shareQRText(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        OutlineButton.icon(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[400])
            ),
            onPressed: null,
            icon: Icon(Icons.share,color: Colors.lightBlue,),
            label: CustomText(text: 'Kyc Pending',color: Colors.lightBlue,)
        ),
        OutlineButton.icon(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[400])
            ),
            onPressed: null,
            icon: Icon(Icons.account_balance_wallet,color: Colors.lightBlue,),
            label: CustomText(text: 'Accept Payment',color: Colors.lightBlue,)
        ),
      ],
    );
  }

  Widget paymentsetting() {
    return ListTile(
      leading: Icon(Icons.payment),
      title: CustomText(
        text: strings.paymentSetting,
        FontSize: 16,
        FontWeights: FontWeight.w700,
      ),
      subtitle: CustomText(
        text: strings.paymentSettingMsg,
        FontSize: 14,
        FontWeights: FontWeight.w400,
        color: Colors.grey[400],
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 30,
      ),
    );
  }

  Widget securtitysetting() {
    return ListTile(
      leading: Icon(Icons.security),
      title: CustomText(
        text: strings.securitySetting,
        FontSize: 16,
        FontWeights: FontWeight.w700,
      ),
      subtitle: CustomText(
        text: strings.securitySettingMsg,
        FontSize: 14,
        FontWeights: FontWeight.w400,
        color: Colors.grey[400],
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 30,
      ),
    );
  }

  Widget notifySetting() {
    return ListTile(
      leading: Icon(Icons.notifications_active),
      title: CustomText(
        text: strings.notificationSetting,
        FontSize: 16,
        FontWeights: FontWeight.w700,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 30,
      ),
    );
  }

  Widget paymentReminder() {
    return ListTile(
      leading: Icon(Icons.payment),
      title: CustomText(
        text: strings.paymentReminders,
        FontSize: 16,
        FontWeights: FontWeight.w700,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 30,
      ),
    );
  }

  Widget savedAddres() {
    return ListTile(
      leading: Icon(Icons.save),
      title: CustomText(
        text: strings.saveAddress,
        FontSize: 16,
        FontWeights: FontWeight.w700,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 30,
      ),
    );
  }

  Widget chatSetting() {
    return ListTile(
      leading: Icon(Icons.settings),
      title: CustomText(
        text: strings.notificationSetting,
        FontSize: 16,
        FontWeights: FontWeight.w700,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 30,
      ),
    );
  }

  Widget logoutButton() {
    return ListTile(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('defaultUser');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Login_Screen()));
      },
      leading: Icon(Icons.power_settings_new),
      title: CustomText(
        text: strings.logout,
        FontSize: 16,
        FontWeights: FontWeight.w700,
      ),
    );
  }

  Widget version(){
    return Container(
      height: 20,
      color: Colors.grey[400],
      child: Center(child: CustomText(text: strings.version)),
    );
  }



}
