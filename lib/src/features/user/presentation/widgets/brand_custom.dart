import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandCustom extends StatelessWidget {
  const BrandCustom({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: height * 0.25),
      child: Center(
        child: Text(
          'WS WORK',
          style: GoogleFonts.jua(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
