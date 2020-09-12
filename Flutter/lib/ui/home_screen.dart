import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var length = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          children: [
            SizedBox(width: 50),
            Text(
              'Greeneva.',
              style: GoogleFonts.merriweatherSans(
                  color: Color(0xff4A69FF), fontSize: 16),
            ),
            SizedBox(width: (width * .4652083333)),
            Text(
              'Home'.toUpperCase(),
              style: GoogleFonts.merriweatherSans(
                  color: Color(0xff4A69FF),
                  fontSize: 16,
                  // letterSpacing: .8,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: (width * .05)),
            Text(
              'Help'.toUpperCase(),
              style: GoogleFonts.merriweatherSans(
                  color: Color(0xff4A69FF),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: (width * .05)),
            Text(
              'Donate'.toUpperCase(),
              style: GoogleFonts.merriweatherSans(
                  color: Color(0xff4A69FF),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: (width * .05)),
            Text(
              'Contact'.toUpperCase(),
              style: GoogleFonts.merriweatherSans(
                  color: Color(0xff4A69FF),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: (width * .05)),
            Text(
              'Account'.toUpperCase(),
              style: GoogleFonts.merriweatherSans(
                  color: Color(0xff4A69FF),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
