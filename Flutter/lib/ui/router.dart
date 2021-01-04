import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/ui/Account/Account.dart';
import 'package:Greeneva/ui/Auth/login_view.dart';
import 'package:Greeneva/ui/Auth/signup_view.dart';
import 'package:Greeneva/ui/Community/Community.dart';
import 'package:Greeneva/ui/Discover/discover.dart';
import 'package:Greeneva/ui/Donation/Donation.dart';
import 'package:Greeneva/ui/NavBar/navigation_bar.dart';
import 'package:Greeneva/ui/Home/home_screen.dart';
import 'package:Greeneva/ui/Home/item_view.dart';
import 'package:Greeneva/ui/intro_screen.dart';
import 'package:Greeneva/ui/theme.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Auth/auth_screen.dart';
import 'Sign_Up/sign_up_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case LoginView:
    //   return _getPageRoute(
    //     routeName: settings.name,
    //     viewToShow: LoginView(),
    //   );
    case AuthView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: AuthScreen(),
      );
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case Auth:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: AuthScreen(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ThemeP(),
      );
    case ItemViewM:
      var arg = settings.arguments;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ItemView(
          model: arg,
        ),
      );
    case NavBarView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ChangeNotifierProvider<BottomNavigationBarProvider>(
          child: NavBar(),
          create: (BuildContext context) => BottomNavigationBarProvider(),
        ),
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

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
