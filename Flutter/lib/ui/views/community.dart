import 'package:flutter/material.dart';

class Commu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
                child: Image.asset(
              'assets/community.png',
              height: 200,
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            "To Get Started With the Community System \nPlease Download the App",
            style: TextStyle(fontSize: 30),
          )),
          SizedBox(
            height: 30,
          ),
          Text("Comming Soon"),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            height: 100,
            minWidth: 40,
            child: Text("Download"),
            color: Colors.lightGreen,
            onPressed: () => print("Icoming"),
          )
        ],
      ),
    ));
  }
}
