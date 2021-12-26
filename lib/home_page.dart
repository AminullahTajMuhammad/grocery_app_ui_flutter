import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
          // buildSearch(),
          // buildCategorys(),
          // buildTopProducts()
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

  }

  Widget buildCategorys() {

  }

  Widget buildTopProducts() {

  }
}