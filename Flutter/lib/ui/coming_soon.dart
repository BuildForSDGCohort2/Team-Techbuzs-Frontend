// import 'package:Greeneva/Services/authenication_service.dart';
import 'package:Greeneva/ui/custom_app_bar.dart';
import 'package:Greeneva/ui/custom_tab_bar.dart';
import 'package:Greeneva/ui/widgets/responsive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    ComingS(),
    // Scaffold(),
    // Scaffold(),
    // Scaffold(),
    // Scaffold(),
    // Scaffold(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    // Icons.,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    // MdiIcons.bellOutline,
    // Icons.menu,
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 100.0),
          child: CustomAppBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: const SizedBox.shrink(),
      ),
    );
  }
}

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
        appBar: AppBar(
          actions: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Greeneva',
                style: TextStyle(color: Color(0xff4A69FF)),
              ),
            )
          ],
          toolbarHeight: 30,
          backgroundColor: Color(0xffFAFAFA),
        ),
        backgroundColor: 1 == 2 ? Color(0xffFAFAFA) : Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                user != null
                    ? Container(
                        child: Text(
                          'Greeneva | #BuildForSDG Cohort 2\n\n Welcome ${user.displayName ?? 'Not Signed IN '}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22,
                              letterSpacing: 1.3,
                              color: Colors.green),
                        ),
                      )
                    : Container(),
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
