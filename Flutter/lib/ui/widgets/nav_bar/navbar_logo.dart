import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Greeneva.',
      style:
          GoogleFonts.merriweatherSans(color: Color(0xff4A69FF), fontSize: 16),
    );
  }
}
