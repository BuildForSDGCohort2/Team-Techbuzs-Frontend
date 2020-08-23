import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
// ignore: avoid_web_libraries_in_flutter
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
                    'Greeneva | #BuildForSDG Cohort 2',
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
                      onTap: () => platformChecker()
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
