import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/ui/views/account_page.dart';
import 'package:Greeneva/ui/views/auth_screen.dart';
// import 'package:Greeneva/ui/coming_soon.dart';
import 'package:Greeneva/ui/views/contact_page.dart';
import 'package:Greeneva/ui/views/donate_page.dart';
import 'package:Greeneva/ui/views/help_page.dart';
import 'package:Greeneva/ui/views/home_screen.dart';
// import 'package:Greeneva/ui/home_screen.dart';
import 'package:Greeneva/ui/views/intro_screen.dart';
import 'package:Greeneva/ui/views/login_view.dart';
import 'package:Greeneva/ui/views/signup_view.dart';
import 'package:Greeneva/ui/views/startup_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SplashView(),
      );
    case Help:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HelpPage(),
      );
    case Donate:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: DonatePage(),
      );
    case Contact:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ContactPage(),
      );
    case Account:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: AccountPage(),
      );
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
    case Startup:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: StartUpView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
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
