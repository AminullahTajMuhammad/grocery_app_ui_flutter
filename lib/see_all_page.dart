import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/contants.dart';

import 'components/product_item.dart';

class SeeAllProducts extends StatefulWidget {
  @override
  _SeeAllProductsState createState() => _SeeAllProductsState();
}

class _SeeAllProductsState extends State<SeeAllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.SURFACE_COLOR,
      appBar: AppBar(
        backgroundColor: Constants.SURFACE_COLOR,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.only(left: 17),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          'Search Product',
          style: TextStyle(
            color: Colors.black,
            fontFamily: GoogleFonts.poppins().fontFamily
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 15),
              child: SvgPicture.asset('assets/ic_shopping.svg'),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 22,
              margin: EdgeInsets.only(right: 15),
              child: SvgPicture.asset('assets/ic_filter.svg'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: initScreen(),
        ),
      ),
    );
  }

  Widget initScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSearch(),
        buildProducts()
      ],
    );
  }

  Widget buildSearch() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Color(0xffE8E8E8),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              margin: EdgeInsets.only(left: 5, right: 10),
              child: TextField(
                maxLines: 1,
                autofocus: false,
                style: TextStyle(
                    color: Constants.PRIMARY_COLOR,
                    fontSize: 16,
                    fontFamily: GoogleFonts.poppins().fontFamily
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for items here',
                ),
                cursorColor: Constants.PRIMARY_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProducts() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.75,
      child: GridView.count(
        primary: false,
        crossAxisCount: 2,
        childAspectRatio: 2.0/3.0,
        shrinkWrap: false,
        children: [
          ProductItem(image: "assets/banana.png", title: "Fresh Banana", price: "\$2.30/Kilo"),
          ProductItem(image: "assets/milk.png", title: "Plain Milk", price: "\$4.10/Bottle"),
          ProductItem(image: "assets/egg_4.png", title: "White Egg", price: "\$6.00/12"),
          ProductItem(image: "assets/banana.png", title: "Fresh Banana", price: "\$2.30/Kilo"),
          ProductItem(image: "assets/milk.png", title: "Plain Milk", price: "\$4.10/Bottle"),
          ProductItem(image: "assets/egg_4.png", title: "White Egg", price: "\$6.00/12"),
        ],
      ),
    );
  }
}
