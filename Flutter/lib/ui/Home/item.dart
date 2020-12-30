import 'package:Greeneva/models/explore_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../locator.dart';
import 'package:Greeneva/constants/routename.dart';

import 'package:Greeneva/Services/navigation_service.dart';

class ListM extends StatelessWidget {
  final ExploreItem model;
  const ListM({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationServiceM _navigationService = locator<NavigationServiceM>();

    var vid = model.y1;
    return GestureDetector(
      onTap: () => _navigationService.navigateTo(ItemViewM, arguments: model),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(28)),
                  height: 199,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: Image.network(
                            "https://img.youtube.com/vi/$vid/hqdefault.jpg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          child: Text(
                            "Goal: ${model.sdg}",
                            style: GoogleFonts.inter(
                                color: Colors.white, fontSize: 19),
                          ),
                          alignment: Alignment.bottomLeft,
                          // co
                        ),
                      )
                    ],
                    // child: Text("Goal: ${model.sdg.toString()}"),
                    // margin: EdgeInsets.only(right: 10),
                    // height: 199,
                    // width: 344,
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //       image: NetworkImage(
                    //           "http://img.youtube.com/vi/TfOJ7HNo-qE/hqdefault.jpg")),
                    //   borderRadius: BorderRadius.circular(28),
                    //   // color: Color(cards[in),
                    // ),
                  )),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          // SizedBox(width: 100)
        ],
      ),
    );
  }
}
