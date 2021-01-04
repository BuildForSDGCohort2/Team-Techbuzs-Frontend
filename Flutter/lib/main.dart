import 'package:Greeneva/Services/analytics_service.dart';
import 'package:Greeneva/Services/dialog_service.dart';
import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/locator.dart';
import 'package:Greeneva/managers/dialog_manager.dart';
// import 'package:Greeneva/ui/Community/constants/colors.dart';
// import 'package:Greeneva/ui/Community/state/app_state.dart';
// import 'package:Greeneva/ui/NavBar/navigation_bar.dart';
import 'package:Greeneva/ui/router.dart';
import 'package:Greeneva/ui/views/startup_view.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:Greeneva/Services/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var token = prefs.getString('token');

  // HttpLink httpLink = HttpLink(uri: 'https://communityfortb.herokuapp.com/');

  // ValueNotifier<GraphQLClient> client = ValueNotifier(
  //   GraphQLClient(cache: InMemoryCache(), link: httpLink),
  // );

  final appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
  // SharedPreferences prefs = await SharedPreferences.getInstance();
//  var token = prefs.getString('token');
  final settings = await Hive.openBox('settings');
  bool isLightTheme = settings.get('isLightTheme') ?? false;
  // // Register all the models and services before the app starts
  await setupLocator();
  print("Models Done");
  print(isLightTheme);
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeProvider(isLightTheme: isLightTheme),
      child: AppStart()));
  // runApp(App(auth: token != null, client: client));
}

//App(auth: token != null, client: client)

class AppStart extends StatelessWidget {
  const AppStart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MyApp(
      themeProvider: themeProvider,
    );
  }
}

// class RestartWidget extends StatefulWidget {
//   RestartWidget({this.child});

//   final Widget child;

//   static void restartApp(BuildContext context) {
//     context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
//   }

//   @override
//   _RestartWidgetState createState() => _RestartWidgetState();
// }

// class _RestartWidgetState extends State<RestartWidget> {
//   Key key = UniqueKey();

//   void restartApp() {
//     setState(() {
//       key = UniqueKey();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return KeyedSubtree(
//       key: key,
//       child: widget.child,
//     );
//   }
// }

// class App extends StatelessWidget {
//   final bool auth;
//   final client;
//   final ThemeProvider themeProvider;

//   App({this.auth = false, this.client, this.themeProvider});

//   @override
//   Widget build(BuildContext context) {
//     return GraphQLProvider(
//       client: client,
//       child: MyApp(
//         auth: auth,
//         themeProvider: themeProvider,
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  // This widget is the root of your application.
  // final bool auth;
  final ThemeProvider themeProvider;

  const MyApp({Key key, @required this.themeProvider}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

// Future setinfodat(bool kauth) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setBool('info', kauth);
// }

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    print("Hello World");
    // setinfodat(widget.auth);
    // print(widget.auth);
  }

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
      // theme: widget.themeProvider.themeData(),
      home: StartUpView(),
      onGenerateRoute: generateRoute,
    );
  }
}
