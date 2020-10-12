import 'package:flutter/material.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.green,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          Text(
            '',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
