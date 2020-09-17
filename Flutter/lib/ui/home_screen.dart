import 'package:Greeneva/Services/authenication_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Greeneva'),

      // ),
      body: Container(
          child: FlatButton(
        child: Text('Sign me out!!!'),
        onPressed: () => AuthenticationService().logout(),
      )),
    );
  }
}
