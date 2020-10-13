import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/ui/views/OnBoarding/coming_soon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../locator.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  /// I'm calling This because I don't like the 50+ Warning about Syntax Error and Blabala.
  /// This does not do any foo  !!!!
  void nothing() {
    print('This Does Nothing LOL :)');
  }

  final NavigationServiceM _navigationService = locator<NavigationServiceM>();

  @override
  Widget build(BuildContext context) {
    String route = "Contact";

    /// TO Be used Uncommenrt
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
                          route.contains("Contact")
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
                      route.contains("Contact")
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
                      route.contains("Contact")
                          ? _navigationService.navigateTo(Help)
                          : nothing();
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
                      route.contains("Contact")
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
                      route.contains("Contact") ? nothing() : nothing();
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
                      route.contains("Contact")
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
        name: 'Contact Page',
      ),
    );
  }
}