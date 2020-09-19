// import 'dart:html';

// import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/ui/Community/Community_welcome.dart';
import 'package:Greeneva/ui/Community/screens/chats/chats.dart';
import 'package:Greeneva/ui/Community/state/app_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../../locator.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  // NavigationService _navigationServiceM = locator<NavigationService>()
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      // bool auth;
      final SharedPreferences perfs = await SharedPreferences.getInstance();
      bool auth = perfs.getBool('info');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => MaterialAppWidget(
                    auth: auth,
                  )));
    });
  }

  var spinkit = SpinKitDoubleBounce(
    color: Colors.red,
    size: 50.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: spinkit),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  final bool auth;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  MaterialAppWidget({this.auth = false}) {
    _firebaseMessaging.configure();
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            appState.currentTheme.brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
      ),
    );

    return MaterialApp(
      theme: appState.currentTheme,
      home: auth ? ChatListScreen() : CommunityWelcome(),
    );
  }
}
