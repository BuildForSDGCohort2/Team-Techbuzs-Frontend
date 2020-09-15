// import 'package:Greeneva/Services/navigation_service.dart';
// import 'package:Greeneva/locator.dart';
import 'package:Greeneva/ui/views/OnBoarding/coming_soon.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    /// I'm calling This because I don't like the 50+ Warning about Syntax Error and Blabala.
    /// This does not do any foo  !!!!
    // void nothing() {
    //   print('This Does Nothing LOL :)');
    // }

    // String route = "Account";

    /// TO Be used Uncommenrt
    // var length = MediaQuery.of(context).size.height;ht;
    // var width = MediaQuery.of(context).size.width;
    return Container(
      child: ComingS(
        name: 'Account Page',
      ),
    );
  }
}
