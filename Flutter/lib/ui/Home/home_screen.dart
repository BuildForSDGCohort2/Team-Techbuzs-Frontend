import 'package:Greeneva/Services/authenication_service.dart';
import 'package:Greeneva/models/explore_model.dart';
import 'package:Greeneva/models/org.dart';
import 'package:Greeneva/ui/Home/home_screen_view_model.dart';
import 'package:Greeneva/ui/Home/item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../Community/constants/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: FlatButton(
        child: Text('Sign me out!!!'),
        onPressed: () => AuthenticationService().logout(),
      )),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final List<ExploreItem> vid;

  HomeScreen({Key key, this.vid}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;

  var user = FirebaseAuth.instance.currentUser;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    print("I'm Here");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Column(
        // physics: ClampingScrollPhysics(),
        children: <Widget>[
          // Custom AppBar

          // Card Section
          SizedBox(
            height: 35,
          ),

          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Good Morning',
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kBlackColor),
                  ),
                  Text(
                    '${user.displayName ?? ""}',
                    style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: kBlackColor),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Featured',
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kBlackColor),
              ),
            ),
          ),
          SizedBox(
            height: 9,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                ...widget.vid.map((vi) => ListM(
                      model: vi,
                    )),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),

          // Operation Section
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Organizations',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor),
                ),
                Row(
                  children: map<Widget>(
                    datas,
                    (index, selected) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        height: 9,
                        width: 9,
                        margin: EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: current == index
                                ? kBlueColor
                                : kTwentyBlueColor),
                      );
                    },
                  ),
                )
              ],
            ),
          ),

          Container(
            height: 130,
            child: ListView.builder(
              itemCount: datas.length,
              padding: EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: OperationCard(
                      operation: datas[index].name,
                      selectedIcon: datas[index].selectedIcon,
                      context: this),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Transaction Section
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 10),
            child: Text(
              'Top Communities',
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: kBlackColor),
            ),
          ),
          ListView.builder(
            itemCount: 2,
            padding: EdgeInsets.only(left: 16, right: 16),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: 76,
                margin: EdgeInsets.only(bottom: 13),
                padding:
                    EdgeInsets.only(left: 24, top: 12, bottom: 12, right: 22),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: kTenBlackColor,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(8.0, 8.0),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 57,
                          width: 57,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/g.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '',
                              // transactions[index].name,
                              style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: kBlackColor),
                            ),
                            Text(
                              "",
                              // transactions[index].date,
                              style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: kGreyColor),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "",
                          // transactions[index].amount,
                          style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: kBlueColor),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  _HomeScreenState context;

  OperationCard(
      {this.operation, this.selectedIcon, this.unselectedIcon, this.context});

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 130,
      height: 130,
      decoration: BoxDecoration(boxShadow: [
        // BoxShadow(
        //   color: kTenBlackColor,
        //   blurRadius: 10,
        //   spreadRadius: 5,
        //   offset: Offset(8.0, 8.0),
        // )
      ], borderRadius: BorderRadius.circular(15), color: kTenBlackColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            widget.selectedIcon,
            height: 85,
          ),
          SizedBox(
            height: 9,
          ),
          Text(
            widget.operation,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 15, fontWeight: FontWeight.w700, color: kBlackColor),
          )
        ],
      ),
    );
  }
}
