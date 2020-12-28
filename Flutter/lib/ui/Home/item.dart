import 'package:Greeneva/models/explore_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListM extends StatelessWidget {
  final ExploreItem model;
  const ListM({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vid = model.y1;
    return GestureDetector(
      child: Container(
          height: 199,
          child: Container(
            child: Text("Goal: ${model.sdg.toString()}"),
            margin: EdgeInsets.only(right: 10),
            height: 199,
            width: 344,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: new NetworkImage(
                      "http://img.youtube.com/vi/$vid/hqdefault.jpg")),
              borderRadius: BorderRadius.circular(28),
              // color: Color(cards[in),
            ),
          )),
    );
  }
}
