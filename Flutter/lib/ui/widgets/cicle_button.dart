import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String link;
  final double iconSize;
  final Function onPressed;

  const CircleButton({
    Key key,
    @required this.link,
    @required this.iconSize,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Image.network(link),
        iconSize: iconSize,
        color: Colors.black,
        onPressed: onPressed,
      ),
    );
  }
}
