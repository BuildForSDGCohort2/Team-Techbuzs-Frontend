import 'package:Greeneva/models/goal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

class GoalMain extends StatefulWidget {
  final Goals goal;
  GoalMain({this.goal});
  @override
  _GoalMainState createState() => _GoalMainState();
}

class _GoalMainState extends State<GoalMain> {
  int klength() {
    if (widget.goal.position == 1) {
      return 17;
    } else if (widget.goal.position == 2) {
      return 10;
    } else if (widget.goal.position == 3) {
      return 10;
    } else if (widget.goal.position == 4) {
      return 10;
    } else if (widget.goal.position == 5) {
      return 10;
    } else if (widget.goal.position == 6) {
      return 10;
    } else if (widget.goal.position == 7) {
      return 10;
    } else if (widget.goal.position == 8) {
      return 10;
    } else if (widget.goal.position == 9) {
      return 10;
    } else if (widget.goal.position == 10) {
      return 10;
    } else if (widget.goal.position == 11) {
      return 10;
    } else if (widget.goal.position == 12) {
      return 10;
    } else if (widget.goal.position == 13) {
      return 10;
    } else if (widget.goal.position == 14) {
      return 10;
    } else if (widget.goal.position == 15) {
      return 10;
    } else if (widget.goal.position == 16) {
      return 10;
    } else if (widget.goal.position == 17) {
      return 10;
    }
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    int col = int.parse("0xff" + "${widget.goal.color}");

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(col),
            title: Text(widget.goal.name),
            elevation: 2,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        top: 60.0,
                      ),
                      height: 520.0,
                      color: Color(col),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: <Widget>[
                          //     GestureDetector(
                          //       onTap: () => Navigator.pop(context),
                          //       child: Icon(
                          //         Icons.arrow_back,
                          //         size: 30.0,
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Text(
                            widget.goal.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            widget.goal.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Text(
                            '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 40.0),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 20.0,
                      bottom: 30.0,
                      child: Hero(
                        tag: widget.goal.iconImage,
                        child: Image(
                          height: 280.0,
                          width: 280.0,
                          image: AssetImage(widget.goal.iconImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 400.0,
                  transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30.0,
                          right: 30.0,
                          top: 40.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'All to know...',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              widget.goal.description ?? "Error",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 40.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Targets',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10.0),

                            // Column(
                            //   children: List.generate(klength(), (index) {
                            //     String target = widget.goal.toString() + '.';
                            //     // String vop  =
                            //     int last() {
                            //       for (int i = 1; i < 10; ++i) {
                            //         if ((target + i.toString()) == null) {
                            //           return i;
                            //         }
                            //       }
                            //       return 0;
                            //     }

                            //     // ignore: unused_local_variable
                            //     String ap =
                            //         target + ((index + 1).toString() + '.' + '1');

                            //     return Card(
                            //       elevation: 2,
                            //       child: SizedBox(
                            //         width: 250,
                            //         height: 60,
                            //         child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children:
                            //                 List.generate((last() - 1), (index) {
                            //               return Card(
                            //                 elevation: 3,
                            //                 child: Column(children: [
                            //                   Text(widget.goal.target[target +
                            //                       (index + 1).toString()]),
                            //                   Column(
                            //                       children:
                            //                           List.generate(5, (index) {
                            //                     String ap = target +
                            //                         ((index + 1).toString() +
                            //                             '.' +
                            //                             '1');
                            //                     return Column(
                            //                       children: [
                            //                         ap == '1.1.1'
                            //                             ? Align(
                            //                                 alignment:
                            //                                     Alignment.topLeft,
                            //                                 child: Text(
                            //                                   widget.goal
                            //                                       .target["1.1"],
                            //                                   style: GoogleFonts
                            //                                       .roboto(
                            //                                     fontSize: 17,
                            //                                     fontWeight:
                            //                                         FontWeight
                            //                                             .bold,
                            //                                   ),
                            //                                 ))
                            //                             : Text(''),
                            //                         SizedBox(
                            //                           height: 5,
                            //                         ),
                            //                         Align(
                            //                           alignment:
                            //                               Alignment.topLeft,
                            //                           child: Text(
                            //                             // index.toString(),
                            //                             'Target' +
                            //                                 ' ' +
                            //                                 ap +
                            //                                 ' ' +
                            //                                 widget.goal.target[ap]
                            //                                     ["name"],

                            //                             // textAlign: TextAlign.left,
                            //                             style: GoogleFonts.roboto(
                            //                               fontSize: 17,
                            //                               fontWeight:
                            //                                   FontWeight.bold,
                            //                             ),
                            //                           ),
                            //                         ),
                            //                         SizedBox(
                            //                           height: 5,
                            //                         ),
                            //                         Align(
                            //                           alignment:
                            //                               Alignment.topLeft,
                            //                           child: Text(
                            //                             'Definition',
                            //                             style: GoogleFonts.roboto(
                            //                               fontSize: 19,
                            //                               fontWeight:
                            //                                   FontWeight.bold,
                            //                             ),
                            //                           ),
                            //                         ),
                            //                         Text(
                            //                           // index.toString(),
                            //                           widget.goal.target[ap]
                            //                               ["definition"],
                            //                           style: GoogleFonts.roboto(
                            //                             fontSize: 17,
                            //                             // fontWeight: FontWeight.bold,
                            //                           ),
                            //                         ),
                            //                         Align(
                            //                           alignment:
                            //                               Alignment.topLeft,
                            //                           child: Text(
                            //                             'Goals',
                            //                             style: GoogleFonts.roboto(
                            //                                 fontSize: 17,
                            //                                 fontWeight:
                            //                                     FontWeight.w700),
                            //                           ),
                            //                         ),
                            //                         Text(
                            //                           // index.toString(),
                            //                           widget.goal.target[ap]
                            //                               ["goals"],
                            //                           style: GoogleFonts.roboto(
                            //                             fontSize: 17,
                            //                             // fontWeight: FontWeight.bold,
                            //                           ),
                            //                         ),
                            //                         widget
                            //                                 .goal
                            //                                 .target[ap]
                            //                                     ["more_research"]
                            //                                 .toString()
                            //                                 .contains('null')
                            //                             ? Align(
                            //                                 alignment:
                            //                                     Alignment.topLeft,
                            //                                 child: Text(
                            //                                   'More Research ',
                            //                                   style: GoogleFonts
                            //                                       .roboto(
                            //                                           fontSize:
                            //                                               17,
                            //                                           fontWeight:
                            //                                               FontWeight
                            //                                                   .w700),
                            //                                 ),
                            //                               )
                            //                             : SizedBox(
                            //                                 height: 0,
                            //                               ),
                            //                         widget
                            //                                 .goal
                            //                                 .target[ap]
                            //                                     ["more_research"]
                            //                                 .toString()
                            //                                 .contains('null')
                            //                             ? Text(
                            //                                 // index.toString(),
                            //                                 widget.goal.target[ap]
                            //                                     ["more_research"],
                            //                                 style: GoogleFonts
                            //                                     .roboto(
                            //                                   fontSize: 17,
                            //                                   // fontWeight: FontWeight.bold,
                            //                                 ),
                            //                               )
                            //                             : SizedBox(
                            //                                 height: 0,
                            //                               ),
                            //                       ],
                            //                     );
                            //                   }))
                            //                 ]),
                            //               );
                            //             })),
                            //       ),
                            //     );
                            //   }), //
                            // )
                            // ListView.builder(itemBuilder: )

                            //  Tatget 1.1 --> 1.1.1
                            /// Target 1.2 --> 1.2.1
                            ///                1.2.2
                            ///                1.3.1
                            // Text(
                            //   widget.goal.target["1.1"],
                            //   style: TextStyle(
                            //     fontSize: 16.0,
                            //     color: Colors.black87,
                            //   ),
                            // ),
                            // Text(
                            //   'Nursery pot width: 12cm',
                            //   style: TextStyle(
                            //     fontSize: 16.0,
                            //     color: Colors.black87,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
