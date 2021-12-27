import 'dart:ffi';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/components/product_item.dart';
import 'package:grocery_app/contants.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.SURFACE_COLOR,
      // ignore: missing_required_param
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Constants.SURFACE_COLOR,
        items: [
          BottomNavyBarItem(
            activeColor: Constants.PRIMARY_COLOR,
            icon: Icon(
              Icons.home,
            ),
            title: Text("Home"),
          ),
          BottomNavyBarItem(
            activeColor: Constants.PRIMARY_COLOR,
            icon: Icon(
              Icons.store,
            ),
            title: Text("Stores"),
          ),
          BottomNavyBarItem(
            activeColor: Constants.PRIMARY_COLOR,
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            title: Text("Favourite"),
          ),
          BottomNavyBarItem(
            activeColor: Constants.PRIMARY_COLOR,
            icon: Icon(
              Icons.person,
            ),
            title: Text("Profile"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: initScreen(),
      ),
    );
  }

  Widget initScreen() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildGreeting(),
          buildSearch(),
          buildCategories(),
          buildTopProducts()
        ],
      ),
    );
  }

  Widget buildGreeting() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 23
                    ),
                    children: [
                      TextSpan(text: 'Hello, ',),
                      TextSpan(
                        text: 'Ella',
                        style: TextStyle(
                          color: Constants.PRIMARY_COLOR,
                        ),
                      ),
                    ]
                  )
                ),
                Text(
                  'What do you need',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 17,
                    color: Constants.GREY_COLOR
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 25,
            top: 20,
            bottom: 1,
            child: Container(
              child: SvgPicture.asset('assets/ic_shopping.svg')
            ),
          )
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Color(0xffE8E8E8),
      ),
      margin: EdgeInsets.only(left: 25, right: 25, top: 25),
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

  Widget buildCategories() {
    return Container(
      margin: EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 30),
            child: Stack(
              children: [
                Text(
                  'Category',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 23,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                          color: Constants.GREY_COLOR,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Constants.GREY_COLOR,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            margin: EdgeInsets.only(right: 25),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                categoryListTile("assets/cat_1.png", "Vegetables"),
                categoryListTile("assets/cat_2.png", "Fruits"),
                categoryListTile("assets/cat_3.png", "Bakery"),
                categoryListTile("assets/cat_4.png", "Spices"),
                categoryListTile("assets/cat_5.png", "Fish"),
              ],
            ),
          )
        ]
      ),
    );
  }

  Widget categoryListTile(String img, String name) {
    return Container(
      margin: EdgeInsets.only(right: 12, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(img),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              name,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTopProducts() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 30, left: 25),
            child: Stack(
              children: [
                Text(
                  'Top Product',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 23,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                          color: Constants.GREY_COLOR,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Constants.GREY_COLOR,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 280,
            child: ListView(
              primary: false,
              scrollDirection: Axis.horizontal,
              children: [
                ProductItem(image: "assets/banana.png", title: "Fresh Banana", price: "\$2.30/Kilo"),
                ProductItem(image: "assets/milk.png", title: "Plain Milk", price: "\$4.10/Bottle"),
                ProductItem(image: "assets/egg_4.png", title: "White Egg", price: "\$6.00/12"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}