import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/my_flutter_app_icons.dart';
import 'package:Greeneva/ui/Account/Account.dart';
import 'package:Greeneva/ui/Community/Community.dart';
import 'package:Greeneva/ui/Discover/discover.dart';
import 'package:Greeneva/ui/Donation/Donation.dart';
import 'package:Greeneva/ui/Home/home_screen.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

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
        children: [HomePage(), Discover(), Community(), Donation(), Account()],
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
            iconData: Oreofe.nav_home,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Oreofe.nav_community,
            label: 'Discover',
          ),
          FFNavigationBarItem(
            iconData: Oreofe.nav_community,
            label: 'Community',
          ),
          FFNavigationBarItem(
            iconData: Oreofe.nav_donation,
            label: 'Donation',
          ),
          FFNavigationBarItem(
            iconData: Oreofe.nav_user,
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

// BubbleBottomBar(
//         // hasNotch: true,
//         fabLocation: BubbleBottomBarFabLocation.end,
//         opacity: .2,
//         currentIndex: currentIndex,
//         onTap: changePage,
//         // borderRadius: BorderRadius.vertical(
//         //     top: Radius.circular(
//         //         16)), //border radius doesn't work when the notch is enabled.
//         elevation: 8,
//         items: <BubbleBottomBarItem>[
//           BubbleBottomBarItem(
//               backgroundColor: Colors.red,
//               icon: WebsafeSvg.asset("assets/nav_home.svg",
//                   height: 30, color: Colors.green),
//               activeIcon: WebsafeSvg.asset("assets/nav_home.svg",
//                   height: 30, color: Colors.blue),
//               title: Text("Home")),
//           BubbleBottomBarItem(
//               backgroundColor: Colors.deepPurple,
//               icon: WebsafeSvg.asset("assets/nav_discover.svg",
//                   height: 30, color: Colors.green),
//               activeIcon: WebsafeSvg.asset("assets/nav_discover.svg",
//                   height: 30, color: Colors.blue),
//               title: Text("Discover")),
//           BubbleBottomBarItem(
//               backgroundColor: Colors.indigo,
//               icon: WebsafeSvg.asset("assets/nav_community.svg",
//                   height: 30, color: Colors.green),
//               activeIcon: WebsafeSvg.asset("assets/nav_community.svg",
//                   height: 30, color: Colors.blue),
//               title: Text("Community")),
//           BubbleBottomBarItem(
//               backgroundColor: Colors.green,
//               icon: WebsafeSvg.asset("assets/nav_donation.svg",
//                   height: 30, color: Colors.green),
//               activeIcon: WebsafeSvg.asset("assets/nav_donation.svg",
//                   height: 30, color: Colors.blue),
//               title: Text("Donate")),
//           BubbleBottomBarItem(
//               backgroundColor: Colors.green,
//               icon: WebsafeSvg.asset("assets/nav_user.svg",
//                   height: 30, color: Colors.green),
//               activeIcon: WebsafeSvg.asset("assets/nav_user.svg",
//                   height: 30, color: Colors.blue),
//               title: Text("Me"))
//         ],
//       ),
