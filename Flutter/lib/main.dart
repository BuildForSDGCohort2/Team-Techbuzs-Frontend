import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greeneva',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  bool platformChecker() {
    if (kIsWeb) {
      return true;
    } else {
      return false;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
