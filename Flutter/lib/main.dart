import 'package:Greeneva/Services/analytics_service.dart';
import 'package:Greeneva/Services/dialog_service.dart';
import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/locator.dart';
import 'package:Greeneva/managers/dialog_manager.dart';
import 'package:Greeneva/ui/intro_screen.dart';
import 'package:Greeneva/ui/router.dart';
import 'package:Greeneva/ui/views/startup_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // // Register all the models and services before the app starts
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greeneva',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      navigatorObservers: [locator<AnalyticsService>().getAnalyticsObserver()],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: StartUpView(),
      onGenerateRoute: generateRoute,
    );
  }
}
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Greeneva',
//       // builder: (context, child) => Navigator(
//       //   key: locator<DialogService>().dialogNavigationKey,
//       //   onGenerateRoute: (settings) => MaterialPageRoute(
//       //       builder: (context) => DialogManager(child: child)),
//       // ),
//       // navigatorKey: locator<NavigationService>().navigationKey,
//       // navigatorObservers: [locator<AnalyticsService>().getAnalyticsObserver()],
//       // theme: ThemeData(
//       //   primarySwatch: Colors.blue,
//       //   visualDensity: VisualDensity.adaptivePlatformDensity,
//       // ),
//       debugShowCheckedModeBanner: false,
//       home: OnBoardingPage(),
//       // onGenerateRoute: generateRoute,
//     );
//   }
// }
