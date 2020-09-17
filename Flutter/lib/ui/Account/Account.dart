import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var spinkit = SpinKitRotatingCircle(
    color: Colors.white,
    size: 50.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: spinkit),
    );
  }
}
