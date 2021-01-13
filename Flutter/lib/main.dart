import 'package:Greeneva/Services/analytics_service.dart';
import 'package:Greeneva/Services/dialog_service.dart';
import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/locator.dart';
import 'package:Greeneva/managers/dialog_manager.dart';

import 'package:Greeneva/ui/router.dart';
import 'package:Greeneva/ui/views/startup_view.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:Greeneva/Services/theme_provider.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

void main() async {
  /// Initialize WidgetBinding For Some Packages
  /// This is need to ensure app does not crash
  WidgetsFlutterBinding.ensureInitialized();

  /// Firebase Requires that the app has to initialize before any of the Firebase Services are called
  /// It is asynchronous so it has to be awaited
  await Firebase.initializeApp();

  /// Using Hive Right Here I seem this is unnecessary Shared Preferences does better
  /// So.... In future updates this should be looked at and changed :)
  final appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  /// Setting up Hive
  final settings = await Hive.openBox('settings');

  /// Light theme boolean is set to as false by defeult
  bool isLightTheme = settings.get('isLightTheme') ?? false;

  /// Register all the models and services before the app starts
  /// The Locator is called to initaize all Models And Services
  await setupLocator();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  if (kDebugMode) {
    // Force disable Crashlytics collection while doing every day development.
    // Temporarily toggle this to true if you want to test crash reporting in your app.

    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    // Handle Crashlytics enabled status when not in Debug,
    // e.g. allow your users to opt-in to crash reporting.
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }

  // Pass all uncaught errors to Crashlytics.

  runApp(

      /// I'm still a baby in using Provider
      /// But Here it is  :)
      /// the Phoenix widget Helps ReBirth The App
      Phoenix(
          child: ChangeNotifierProvider(
              create: (_) => ThemeProvider(isLightTheme: isLightTheme),
              child: AppStart())));
  // runApp(App(auth: token != null, client: client));
}

//App(auth: token != null, client: client)

class AppStart extends StatelessWidget {
  const AppStart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// to ensure we have the themeProvider before the app starts lets make a few more changes.
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MyApp(
      themeProvider: themeProvider,
    );
  }
}

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  final ThemeProvider themeProvider;

  const MyApp({Key key, @required this.themeProvider}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greeneva',
      builder: (context, child) => Navigator(
        key: locator<DialogServiceM>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationServiceM>().navigationKey,
      navigatorObservers: [locator<AnalyticsService>().getAnalyticsObserver()],
      debugShowCheckedModeBanner: false,
      theme: widget.themeProvider.themeData(),
      home: StartUpView(),
      onGenerateRoute: generateRoute,
    );
  }
}
