import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/ui/views/Account/account_page.dart';
import 'package:Greeneva/ui/views/Auth/auth.dart';
// import 'package:Greeneva/ui/coming_soon.dart';
import 'package:Greeneva/ui/views/Contacts/contact_page.dart';
import 'package:Greeneva/ui/views/Donate/donate_page.dart';
import 'package:Greeneva/ui/views/Info/help_page.dart';
import 'package:Greeneva/ui/views/Home/home_screen.dart';
// import 'package:Greeneva/ui/home_screen.dart';
import 'package:Greeneva/ui/views/OnBoarding/intro_screen.dart';
import 'package:Greeneva/ui/views/Auth/login_view.dart';
import 'package:Greeneva/ui/views/Auth/signup_view.dart';
import 'package:Greeneva/ui/views/Startup/startup_view.dart';
import 'package:Greeneva/ui/widgets/info_list/target.dart';
import 'package:Greeneva/ui/views/community.dart';

import 'package:flutter/material.dart';

import 'views/layout_template/layout_template.dart';

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
        viewToShow: Info(),
      );
      case Community:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Commu(),
      );
    case TargetsView:
      var arg = settings.arguments;

      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Targets(
          model: arg,
        ),
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
        viewToShow: Auth(),
      );
    case Layout:
      // var arg = settings.arguments;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LayoutTemplate(
            // argument: arg == null ? AuthView : arg,
            ),
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
  return _FadeRoute(child: viewToShow, routeName: routeName);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                child,
            settings: RouteSettings(name: routeName),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(
                  opacity: animation,
                  child: child,
                ));
}
