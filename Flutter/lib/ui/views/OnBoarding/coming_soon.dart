// import 'package:Greeneva/Services/authenication_service.dart';
import 'package:Greeneva/Services/email_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ComingS extends StatefulWidget {
  String name;
  ComingS({this.name});

  @override
  _ComingSState createState() => _ComingSState();
}

class _ComingSState extends State<ComingS> {
  /// I'm calling This because I don't like the 50+ Warning about Syntax Error and Blabala.
  /// This does not do any foo  !!!!
  void nothing() {
    print('This Does Nothing LOL :)');
  }

  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser;
    return Scaffold(
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
                          'Greeneva | #BuildForSDG Cohort 2',
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
                Container(
                  child: Text(
                    widget.name != null
                        ? '${widget.name} is Working on It'
                        : '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22, letterSpacing: 1.3, color: Colors.green),
                  ),
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
                        onTap: () async {
                          // print("admin\$");
                          user != null
                              ? EmailService().sendEmail(
                                  'message', user.email, user.displayName)
                              : nothing();
                        }))
              ],
            ),
          ),
        ));
  }
}
