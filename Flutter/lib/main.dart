import 'package:Greeneva/Services/analytics_service.dart';
import 'package:Greeneva/Services/dialog_service.dart';
import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/locator.dart';
import 'package:Greeneva/managers/dialog_manager.dart';
import 'package:Greeneva/ui/router.dart';
import 'package:Greeneva/ui/views/Startup/startup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // // Register all the models and services before the app starts
  await setupLocator();
  RenderErrorBox.backgroundColor = Colors.transparent;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greeneva',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationServiceM>().navigatorKey,
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
