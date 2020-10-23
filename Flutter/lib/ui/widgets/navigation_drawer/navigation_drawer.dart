import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/ui/widgets/navigation_drawer/drawer_item.dart';
import 'package:Greeneva/ui/widgets/navigation_drawer/navigation_drawer_header.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;

    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          // BONUS: Combine the UI for this widget with the NavBarItem and make it responsive.
          // The UI for the current DrawerItem shows when it's in mobile, else it shows the NavBarItem ui.
          DrawerItem('Home', Icons.home, HomeViewRoute),
          DrawerItem('Info', Icons.info, Help),
          DrawerItem('Donate', Icons.clean_hands, Donate),
          DrawerItem('Community', Icons.info, Community),
          DrawerItem(user != null ? 'Account' : 'Login', Icons.info,
              user != null ? HomeViewRoute : OnBoarding),
        ],
      ),
    );
  }
}
