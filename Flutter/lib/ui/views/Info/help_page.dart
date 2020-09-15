// import 'package:Greeneva/Services/navigation_service.dart';
// import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/ui/views/OnBoarding/coming_soon.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../locator.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  // final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    /// I'm calling This because I don't like the 50+ Warning about Syntax Error and Blabala.
    /// This does not do any foo  !!!!
    // void nothing() {
    //   print('This Does Nothing LOL :)');
    // }

    // String route = "Help";
    //// TO Be USed Uncomment
    // var length = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Container(
      child: ComingS(
        name: 'Help Page',
      ),
    );
  }
}
