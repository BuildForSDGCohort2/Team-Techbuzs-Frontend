import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/ui/views/coming_soon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../locator.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    /// I'm calling This because I don't like the 50+ Warning about Syntax Error and Blabala.
    /// This does not do any foo  !!!!
    void nothing() {
      print('This Does Nothing LOL :)');
    }

    String route = "Help";
    //// TO Be USed Uncomment
    // var length = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                          route.contains("Help")
                              ? _navigationService.navigateTo(HomeViewRoute)
                              : nothing();
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
                      route.contains("Help")
                          ? Icon(
                              Icons.ac_unit_rounded,
                              color: Colors.green,
                              size: 10,
                            )
                          : null,
                    ],
                  ),
                  SizedBox(width: (width / 20)),
                  GestureDetector(
                    onTap: () {
                      route.contains("Help") ? nothing() : nothing();
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
                      route.contains("Help")
                          ? _navigationService.navigateTo(Donate)
                          : nothing();
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
                      route.contains("Help")
                          ? _navigationService.navigateTo(Contact)
                          : nothing();
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
                      route.contains("Help")
                          ? _navigationService.navigateTo(Account)
                          : nothing();
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
      body: ComingS(
        name: 'Help Page',
      ),
    );
  }
}
