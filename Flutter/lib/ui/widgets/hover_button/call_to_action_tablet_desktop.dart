import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CallToActionTabletDesktop extends StatelessWidget {
  // final String title;
  const CallToActionTabletDesktop(
      this.length, this.link, this.name, this.onPress);
  final double length;
  final String link;
  final String name;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      height: length / 10,
      minWidth: length / 2,
      color: Colors.white,
      child: Row(
        children: [
          Image.network(
            link,
            height: 50,
          ),
          SizedBox(
            width: 39,
          ),
          Center(
              child: Text(
            name,
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
          )),
        ],
      ),
    );
  }
}
