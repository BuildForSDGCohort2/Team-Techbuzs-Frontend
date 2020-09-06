import 'package:Greeneva/Services/analytics_service.dart';
import 'package:Greeneva/Services/dialog_service.dart';
import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/Services/state.dart';
import 'package:Greeneva/locator.dart';
import 'package:Greeneva/managers/dialog_manager.dart';
import 'package:Greeneva/ui/router.dart';
import 'package:Greeneva/ui/views/startup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');

  HttpLink httpLink = HttpLink(uri: 'https://communityfortb.herokuapp.com/');

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(cache: InMemoryCache(), link: httpLink),
  );
  // // Register all the models and services before the app starts
  await setupLocator();
  runApp(App(auth: token != null, client: client));
}

class App extends StatelessWidget {
  final bool auth;
  final client;
  App({this.auth = false, this.client});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: ChangeNotifierProvider<AppState>(
          create: (_) => AppState(),
          child: MyApp(auth: auth),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  final bool auth;
  MyApp({this.auth});

  @override
  _MyAppState createState() => _MyAppState();
}

Future setinfodat(bool kauth) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('info', kauth);
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    setinfodat(widget.auth);
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
