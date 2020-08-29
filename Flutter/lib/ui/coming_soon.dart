import 'package:Greeneva/Services/authenication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'dart:html' as html;
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class ComingS extends StatelessWidget {
  bool platformChecker() {
    if (kIsWeb) {
      return true;
    } else if (Platform.isAndroid || Platform.isIOS) {
      return false;
    } else {
      return false;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Greeneva | #BuildForSDG Cohort 2\n\n Welcome ${user.displayName ?? 'Not Signed IN '}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22, letterSpacing: 1.3, color: Colors.green),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.6,
                ),
                Center(
                  child: Image.asset('assets/P4id.gif'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.6,
                ),
                Container(
                  child: Text('By TechBuzs Group'),
                ),
                Container(
                  child: GestureDetector(
                      child: Image.asset(
                        'assets/git.jpeg',
                        height: 50,
                      ),
                      onTap: () =>
                          // {print('Done'), AuthenticationService().logout()}
                          platformChecker()
                              ? js.context.callMethod("open", [
                                  "https://github.com/BuildForSDGCohort2/Team-Techbuzs-Frontend"
                                ])
                              : html.window.open(
                                  "https://github.com/BuildForSDGCohort2/Team-Techbuzs-Frontend",
                                  'GitHub')),
                )
              ],
            ),
          ),
        ));
  }
}
