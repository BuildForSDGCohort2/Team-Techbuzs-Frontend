import 'package:Greeneva/Services/Api/goals_model.dart';
import 'package:Greeneva/ui/widgets/info_list/target_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Targets extends StatelessWidget {
  final GoalAPI model;

  Targets({this.model});

  @override
  Widget build(BuildContext context) {
    int goal = model.goal;
    // String idm =
    String target = goal.toString() + '.';
    final children = <Widget>[];

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 110,
            ),
         Align(
           alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
         ),
            Card(
                color: Colors.white,
                elevation: 1,
                child: SizedBox(
                  // width: 360,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          // height: 180,
                          child: Image.asset(
                            model.image == null
                                ? 'assets/SDGs/sdg1.png'
                                : model.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text('${model.title ?? 'LOL'}',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20, fontWeight: FontWeight.bold)
                                  // softWrap: true,
                                  ),
                            ),
                            Text(
                              'Information',
                              style: GoogleFonts.roboto(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('${model.keywords ?? 'LOL'} ',
                                style: GoogleFonts.roboto(fontSize: 19)),
                            Text(
                              'Target',
                              style: GoogleFonts.roboto(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '',
                              // model.target[target + '1']["definition"],
                              style: GoogleFonts.roboto(
                                fontSize: 19,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Column(
                                children: List.generate(5, (index) {
                              String ap =
                                  target + ((index + 1).toString() + '.' + '1');
                              return Column(
                                children: [
                                  ap == '1.1.1'
                                      ? Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            model.target["1.1"],
                                            style: GoogleFonts.roboto(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))
                                      : Text(''),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      // index.toString(),
                                      'Target' +
                                          ' ' +
                                          ap +
                                          ' ' +
                                          model.target[ap]["name"],

                                      // textAlign: TextAlign.left,
                                      style: GoogleFonts.roboto(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Definition',
                                      style: GoogleFonts.roboto(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    // index.toString(),
                                    model.target[ap]["definition"],
                                    style: GoogleFonts.roboto(
                                      fontSize: 17,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Goals',
                                      style: GoogleFonts.roboto(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Text(
                                    // index.toString(),
                                    model.target[ap]["goals"],
                                    style: GoogleFonts.roboto(
                                      fontSize: 17,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  model.target[ap]["more_research"]
                                          .toString()
                                          .contains('null')
                                      ? Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'More Research ',
                                            style: GoogleFonts.roboto(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                      : SizedBox(
                                          height: 0,
                                        ),
                                  model.target[ap]["more_research"]
                                          .toString()
                                          .contains('null')
                                      ? Text(
                                          // index.toString(),
                                          model.target[ap]["more_research"],
                                          style: GoogleFonts.roboto(
                                            fontSize: 17,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : SizedBox(
                                          height: 0,
                                        ),
                                ],
                              );
                            }))

                            // for (int i; i > 3; i++)
                            // children.add( new Lis(i.toString()))
                            // Text(i.toString())
                          ],
                        ),
                      ),
                    ],
                  ),
                ))

            // Text(model.targets['1.1'].toString())
          ],
        ),
      ),
    );
  }
}
