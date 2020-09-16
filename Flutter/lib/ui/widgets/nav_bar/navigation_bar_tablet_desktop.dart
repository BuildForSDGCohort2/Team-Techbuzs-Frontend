// import 'package:Greeneva/Services/authenication_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/ui/widgets/nav_item/nav_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'navbar_item.dart';
import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;

    return Container(
      // height: ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('Home', HomeViewRoute),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Help', Help),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Donate', Donate),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Info', Help),
              SizedBox(
                width: 60,
              ),
              NavBarItem(user != null ? 'Account' : 'Login',
                  user != null ? HomeViewRoute : OnBoarding),
            ],
          )
        ],
      ),
    );
  }
}
