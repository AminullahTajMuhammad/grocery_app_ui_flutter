import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {

  final String image;
  final String title;
  final String price;

  ProductItem({this.image, this.title, this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 15),
      child: Container(
        width: 180,
        height: 280,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [Color(0xffE8E8E8),Color(0xffF7FFF7)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Image.asset(
                image,
                height: 140,
                scale: 1,
              ),
            ),
            Container(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              child: Text(
                price,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(7),
              width: 120,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Color(0xff08a045),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
