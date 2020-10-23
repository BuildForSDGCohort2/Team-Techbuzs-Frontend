// import 'package:Greeneva/Services/navigation_service.dart';
// import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/ui/views/Donate/Sdg15.dart';
import 'package:Greeneva/ui/views/OnBoarding/coming_soon.dart';
import 'package:flutter/material.dart';
import 'package:Greeneva/Services/paypal.dart';

import '../../../locator.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../locator.dart';

class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  /// I'm calling This because I don't like the 50+ Warning about Syntax Error and Blabala.
  /// This does not do any foo  !!!!
  void nothing() {
    print('This Does Nothing LOL :)');
  }

  final NavigationServiceM _navigationService = locator<NavigationServiceM>();

  @override
  Widget build(BuildContext context) {
    // String route = "Donate";

    /// TO Be used Uncommenrt
    // var length = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Help the Sustainable Development Goals\n And Donate to the SDG #15, SDG #16 and SDG #3",
              style: TextStyle(color: Colors.grey, fontSize: 30),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => _navigationService.navigateTo(Sdg15),
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: SizedBox(
                    width: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 180,
                          child: Image.asset(
                            'assets/SDGs/sdg15.png',
                            fit: BoxFit.cover,
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
                              Text(
                                "Sustainably manage forests, combat desertification, halt and reverse land degradation, halt biodiversity loss",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () => _navigationService.navigateTo(Sdg16),
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: SizedBox(
                    width: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 180,
                          child: Image.asset(
                            'assets/SDGs/sdg16.png',
                            fit: BoxFit.cover,
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
                              Text(
                                "Promote just, peaceful and inclusive societies",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () => _navigationService.navigateTo(Sdg3),
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: SizedBox(
                    width: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 180,
                          child: Image.asset(
                            'assets/SDGs/sdg3.png',
                            fit: BoxFit.cover,
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
                              Text(
                                "Ensure healthy lives and promote well-being for all at all ages",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
