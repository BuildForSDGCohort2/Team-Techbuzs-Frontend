import 'package:Greeneva/Components/FadeAnimation.dart';
import 'package:Greeneva/ui/Donation/Plant/plant_tree.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'onetreeplanted/widgets/carosurel.dart';

class Trees extends StatefulWidget {
  @override
  _TreesState createState() => _TreesState();
}

class _TreesState extends State<Trees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Plant Tree'),
        backgroundColor: Colors.tealAccent,
      ),
      body: Center(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 9,
                ),
                FadeAnimation(
                  1.5,
                  Image.network(
                    'https://i.pinimg.com/originals/36/dc/47/36dc479b454578408d96c4a6c7ce1a98.png',
                    height: MediaQuery.of(context).size.height / 3.5,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    2,
                    CupertinoButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => PlantDet()));
                      },
                      color: Colors.greenAccent,
                      child: Text('Plant A Tree By Yourself'),
                    )),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                    2.5,
                    CupertinoButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Loading1()));
                      },
                      color: Colors.green[200],
                      child: Text('Plant A Tree With Us'),
                    )),
                SizedBox(
                  height: 21,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
