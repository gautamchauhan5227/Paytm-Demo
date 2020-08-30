import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:paytm_demo/Db_Helper/User_Db_Helper.dart';
import 'package:paytm_demo/Model/User_Model.dart';
import 'package:paytm_demo/Screen/QRScanner_Screen.dart';
import 'package:paytm_demo/Screen/Transaction_Screen.dart';
import 'package:paytm_demo/Units/strings.dart';
import 'package:paytm_demo/Widgets/TextUnit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login_Screen.dart';
import 'Profile_Screen.dart';

class Home_Screen extends StatefulWidget {
  final String number;

  Home_Screen({this.number});

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  var dbHelper;
  String name = "", number = "";
  bool userImage = true;
  User user;
  List<User> user_data;

  DBHelper DBHelpers;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    fetch_data();
    // userTotalData = user_data;
  }

  void fetch_data() async {
    user_data = await dbHelper.getUser();
    validate_user_data();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          floatingActionButton: scanQRButton(),
          drawer: Drawer(
            child: drawerData(),
          ),
          body: mainLayout(),
        ),
      ),
    );
  }

  Widget scanQRButton(){
    return Padding(
      padding: const EdgeInsets.only(left:20.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
            backgroundColor: Colors.blue[900],
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>QRScanner_Screen(number:widget.number)));
            },
            label: Row(
              children: <Widget>[
                Icon(Icons.scanner),
                Text(strings.scanAnyQR)
              ],
            ),),
      ),
    );
  }

  Widget mainLayout() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              topIcon(),
              adsImgSlider(),
              SizedBox(
                height: 5.0,
              ),
              moreItemCard(),
              SizedBox(
                height: 5.0,
              ),
              moreShop(),
              adsImgSlider(),
              SizedBox(
                height: 5.0,
              ),
              miniProgramCard(),
            ],
          ),
        ),
        bottomColor(),
      ],
    );
  }


  Widget topIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: <Widget>[
            Icon(
              Icons.account_circle,
              color: Colors.grey[200],
              size: 50,
            ),
            SizedBox(width: 10,),
            CustomText(
              text: "Hi $number !",
              FontWeights: FontWeight.w700,
              color: Colors.blue[900],
              FontSize: 16,
            ),
          ],
        ),

        Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.blueAccent,
              size: 40,
            ),
            Icon(
              Icons.message,
              color: Colors.blueAccent[900],
              size: 40,
            ),
          ],
        ),
      ],
    );
  }


  Widget adsImgSlider() {
    return Container(
      height: 170,
      width: double.maxFinite,
      child: Card(
        child: Carousel(
          boxFit: BoxFit.cover,
          autoplay: false,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 5000),
          dotSize: 7.0,
          dotColor: Color(0xFFFF335C),
          dotIncreasedColor: Color(0xFFFF335C),
          dotBgColor: Colors.transparent,
          dotPosition: DotPosition.bottomCenter,
          dotVerticalPadding: 10.0,
          showIndicator: true,
          indicatorBgPadding: 7.0,
          images: [
            ExactAssetImage("assets/paytmImg.jpeg"),
            ExactAssetImage("assets/paytmImg.jpeg"),
            ExactAssetImage("assets/paytmImg.jpeg"),
            ExactAssetImage("assets/paytmImg.jpeg"),
          ],
        ),
      ),
    );
  }

  Widget moreItemCard() {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconCreate(
                Icon(
                  Icons.phone_android,
                ),
                strings.rechargeAndBill,
              ),
              iconCreate(
                Icon(
                  Icons.account_balance,
                ),
                strings.bank,
              ),
              iconCreate(
                Icon(
                  Icons.people,
                ),
                strings.buyInsurance,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconCreate(
                Icon(
                  Icons.directions_transit,
                ),
                strings.travel,
              ),
              iconCreate(
                Icon(
                  Icons.shopping_basket,
                ),
                strings.onlineShopping,
              ),
              iconCreate(
                Icon(
                  Icons.keyboard_arrow_down,
                ),
                strings.showMore,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget moreShop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          alignment: Alignment.center,
          height: 40,
          width: 120,
          color: Colors.lightBlue.withOpacity(0.2),
          child: CustomText(
            text: 'Collect Stickers',
            color: Colors.blue,
            FontSize: 16,
          ),
        ),
        Container(
          height: 40,
          width: 180,
          color: Colors.lightBlue.withOpacity(0.2),
          alignment: Alignment.center,
          child: CustomText(
            text: 'Mobile Accessories',
            color: Colors.blue,
            FontSize: 20,
          ),
        )
      ],
    );
  }

  Widget miniProgramCard() {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                text: strings.miniPrograms,
                FontWeights: FontWeight.bold,
                FontSize: 16,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconCreate(
                Icon(
                  Icons.fastfood,
                ),
                strings.dominos,
              ),
              iconCreate(
                Icon(
                  Icons.directions_car,
                ),
                strings.ola,
              ),
              iconCreate(
                Icon(
                  Icons.fastfood,
                ),
                strings.McDelivery,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomColor() {
    return Container(
      color: Colors.blue[900],
      height: 10,
      child: Column(
        children: <Widget>[
          Container(
            height: 5,
            color: Colors.lightBlue,
          )
        ],
      ),
    );
  }

  Widget drawerData() {
    return ListView(
      children: <Widget>[
        profileArea(),
        SizedBox(height: 10,),
        cashbackText(),
        Divider(),
        orderText(),
        Divider(),
        settingText(),
        Divider(),
        scanText(),
        Divider(),
        allTransaction(),
        Divider(),
        logout(),
      ],
    );
  }

  Widget profileArea() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [Colors.blue[900], Colors.lightBlue]
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Icon(
                Icons.account_circle,
                color: Colors.grey[300],
                size: 60,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            CustomText(
              text: number,
              FontWeights: FontWeight.w700,
              color: Colors.white,
              FontSize: 16,
            )
          ],
        ),
      ),
    );
  }

  Widget cashbackText() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.add_circle_outline),
          title: CustomText(
            text: strings.cashback,
            FontSize: 16,
            FontWeights: FontWeight.w700,
          ),
          subtitle: CustomText(
            text: strings.cashbackMsg,
            FontSize: 14,
            FontWeights: FontWeight.w400,
            color: Colors.grey,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget orderText() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.shopping_basket),
          title: CustomText(
            text: strings.orderBooking,
            FontSize: 16,
            FontWeights: FontWeight.w700,
          ),
          subtitle: CustomText(
            text: strings.orderBookingMsg,
            FontSize: 14,
            FontWeights: FontWeight.w400,
            color: Colors.grey,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget scanText() {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>QRScanner_Screen(number:widget.number)));
          },
          leading: Icon(Icons.scanner),
          title: CustomText(
            text: strings.scanAnyQR,
            FontSize: 16,
            FontWeights: FontWeight.w700,
          ),
          subtitle: CustomText(
            text: 'Scan QR Code For Transfer Money',
            FontSize: 14,
            FontWeights: FontWeight.w400,
            color: Colors.grey,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget settingText() {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile_Screen(number:number,name:name)));
          },
          leading: Icon(Icons.settings),
          title: CustomText(
            text: strings.settings,
            FontSize: 16,
            FontWeights: FontWeight.w700,
          ),
          subtitle: CustomText(
            text: strings.settingMsg,
            FontSize: 14,
            FontWeights: FontWeight.w400,
            color: Colors.grey,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget allTransaction() {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Transaction_Screen(number: widget.number,)));
          },
          leading: Icon(Icons.account_balance_wallet),
          title: CustomText(
            text: 'All Transaction',
            FontSize: 16,
            FontWeights: FontWeight.w700,
          ),
          subtitle: CustomText(
            text: 'Show All Transaction with Your Friends!',
            FontSize: 14,
            FontWeights: FontWeight.w400,
            color: Colors.grey,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget logout() {
    return Column(
      children: <Widget>[
        ListTile(
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
        ),
      ],
    );
  }

  iconCreate(Icon icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 100,
        width: 70,
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.lightBlue.withOpacity(0.1),
              child: icon,
            ),
            CustomText(
              text: text,
              maxLine: 2,
              align: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
  




  void validate_user_data() {
    for (int i = 0; i < user_data.length; i++) {
      if (user_data[i].number == widget.number) {
        setState(() {
          number = user_data[i].number;
          name = user_data[i].name;
        });
        break;
      }
    }
  }
}
