import 'package:Greeneva/ui/Account/Account.dart';
import 'package:Greeneva/ui/Community/Community.dart';
import 'package:Greeneva/ui/Discover/discover.dart';
import 'package:Greeneva/ui/Home/wait_view.dart';
import 'package:Greeneva/ui/Donation/Donation.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  NavBar({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final NavigationServiceM _navigationService = locator<NavigationService>();

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [Wait(), Loading(), Donation(), Account()],
      ),
      // body: currentIndex == 0
      //     ? HomePage()
      //     : currentIndex == 1
      //         ? Discover()
      //         : currentIndex == 2
      //             ? Community()
      //             : currentIndex == 3
      //                 ? Donation()
      //                 : currentIndex == 4
      //                     ? Account()
      //                     : {},
      // appBar: AppBar(
      //   title: Text.title),
      // ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.yellow,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: currentIndex,
        onSelectTab: changePage,
        items: [
          FFNavigationBarItem(
            // iconData: Icons.access_alarm_sharp,
            // iconData: Oreofe.nav_home,
            svgasset: "assets/nav/nav_home.svg",
            label: 'Home',
            itemWidth: 19,
          ),
          FFNavigationBarItem(
            // iconData: Icons.access_alarm_sharp,
            // iconData: Oreofe.nav_discover,
            svgasset: "assets/nav/nav_discover.svg",
            label: 'Discover',
            itemWidth: 19,
          ),
          FFNavigationBarItem(
            // iconData: Icons.access_alarm_sharp,
            // iconData: Oreofe.nav_donation,
            svgasset: "assets/nav/nav_donation.svg",
            label: 'Donation',
            itemWidth: 19,
          ),
          FFNavigationBarItem(
            // iconData: Icons.access_alarm_sharp,
            // iconData: Oreofe.nav_user,
            svgasset: "assets/nav/nav_user.dart",
            label: 'Account',
            itemWidth: 19,
          ),
        ],
      ),
    );
  }
}
