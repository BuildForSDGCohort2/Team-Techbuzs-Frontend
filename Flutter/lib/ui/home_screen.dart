import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../locator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String route = "Home";
    var length = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final NavigationService _navigationService = locator<NavigationService>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: !(width < 710)
            ? Row(
                children: [
                  SizedBox(width: width / 20),
                  Text(
                    'Greeneva.',
                    style: GoogleFonts.merriweatherSans(
                        color: Color(0xff4A69FF), fontSize: 16),
                  ),

                  // Center(
                  //       child: Text(
                  //     '.',
                  //       )),
                  !(width < 1314)
                      ? SizedBox(width: (width / 2.4))
                      : !(width < 500)
                          ? SizedBox(width: (width / 7))
                          : SizedBox(width: (width / 25)),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          route.contains("Home") ? {} : {};
                        },
                        // onTap: () => !ishome,
                        child: Text(
                          'Home'.toUpperCase(),
                          style: GoogleFonts.merriweatherSans(
                              color: Color(0xff4A69FF),
                              fontSize: 16,
                              // letterSpacing: .8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      route.contains("Home")
                          ? Icon(
                              Icons.ac_unit_rounded,
                              color: Colors.green,
                              size: 10,
                            )
                          : {},
                    ],
                  ),
                  SizedBox(width: (width / 20)),
                  GestureDetector(
                    onTap: () {
                      route.contains("Home")
                          ? _navigationService.navigateTo(Help)
                          : {};
                    },
                    child: Text(
                      'Help'.toUpperCase(),
                      style: GoogleFonts.merriweatherSans(
                          color: Color(0xff4A69FF),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: (width / 20)),
                  GestureDetector(
                    onTap: () {
                      route.contains("Home")
                          ? _navigationService.navigateTo(Donate)
                          : {};
                    },
                    child: Text(
                      'Donate'.toUpperCase(),
                      style: GoogleFonts.merriweatherSans(
                          color: Color(0xff4A69FF),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: (width / 20)),
                  GestureDetector(
                    onTap: () {
                      route.contains("Home")
                          ? _navigationService.navigateTo(Contact)
                          : {};
                    },
                    child: Text(
                      'Contact'.toUpperCase(),
                      style: GoogleFonts.merriweatherSans(
                          color: Color(0xff4A69FF),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: (width / 20)),
                  GestureDetector(
                    onTap: () {
                      route.contains("Home")
                          ? _navigationService.navigateTo(Account)
                          : {};
                    },
                    child: Text(
                      'Account'.toUpperCase(),
                      style: GoogleFonts.merriweatherSans(
                          color: Color(0xff4A69FF),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            : null,
      ),
      body: Container(),
    );
  }
}
