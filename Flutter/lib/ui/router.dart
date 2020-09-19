import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/ui/Account/Account.dart';
import 'package:Greeneva/ui/Community/Community.dart';
import 'package:Greeneva/ui/Discover/discover.dart';
import 'package:Greeneva/ui/Donation/Donation.dart';
import 'package:Greeneva/ui/NavBar/navigation_bar.dart';
import 'package:Greeneva/ui/home_screen.dart';
// import 'package:Greeneva/ui/home_screen.dart';
import 'package:Greeneva/ui/intro_screen.dart';
import 'package:Greeneva/ui/views/Auth/auth_screen.dart';
import 'package:Greeneva/ui/views/Auth/login_view.dart';
import 'package:Greeneva/ui/views/Auth/signup_view.dart';

import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: AuthScreen(),
      );

    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case NavBarView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: NavBar(),
      );
    case DiscoverView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Discover(),
      );
    case CommunityView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Community(),
      );
    case DonationView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Donation(),
      );
    case AccountView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Account(),
      );

    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomePage(),
      );
    case OnBoarding:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: OnBoardingPage(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
