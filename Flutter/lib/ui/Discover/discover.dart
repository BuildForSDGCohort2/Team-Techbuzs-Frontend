import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  var spinkit = SpinKitRotatingCircle(
    color: Colors.blue,
    size: 50.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: spinkit),
    );
  }
}
