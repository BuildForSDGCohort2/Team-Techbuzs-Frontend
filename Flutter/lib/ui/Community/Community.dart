import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
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
