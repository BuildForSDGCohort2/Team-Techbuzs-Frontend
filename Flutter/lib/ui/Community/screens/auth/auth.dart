import 'package:Greeneva/ui/Community/screens/auth/components/auth_views.dart';
import 'package:Greeneva/ui/Community/screens/auth/components/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarComponent(
        tabs: ["LOG IN", "SIGN UP"],
        tabViews: <Widget>[
          AuthViews(),
          AuthViews(signup: true),
        ],
      ),
    );
  }
}
