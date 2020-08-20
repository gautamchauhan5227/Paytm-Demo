import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:paytm_demo/Units/strings.dart';
import 'package:paytm_demo/Widgets/TextUnit.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          drawer: Drawer(),
          backgroundColor: Colors.white,
          body: mainLayout(),
        ),
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
        Icon(
          Icons.account_circle,
          color: Colors.grey[200],
          size: 70,
        ),
        Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.blueAccent,
              size: 50,
            ),
            Icon(
              Icons.message,
              color: Colors.blueAccent[900],
              size: 50,
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
          animationDuration: Duration(milliseconds: 1000),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          height: 40,
          width: 180,
          color: Colors.lightBlue.withOpacity(0.2),
          child: CustomText(
            text: 'Collect Stickers',
            color: Colors.blue,
            FontSize: 20,
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
      color: Colors.blueAccent,
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
}
