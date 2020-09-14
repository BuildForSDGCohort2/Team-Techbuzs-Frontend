import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/ui/widgets/navigation_drawer/drawer_item.dart';
import 'package:Greeneva/ui/widgets/navigation_drawer/navigation_drawer_header.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          DrawerItem('Episodes', Icons.home, HomeViewRoute),
          DrawerItem('About', Icons.help, Help),
        ],
      ),
    );
  }
}
