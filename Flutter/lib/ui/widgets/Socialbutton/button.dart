import 'package:Greeneva/Services/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required DialogService dialogService,
    @required this.length,
    @required this.link,
    @required this.name,
    this.onPress,
  })  : _dialogService = dialogService,
        super(key: key);

  final DialogService _dialogService;
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
