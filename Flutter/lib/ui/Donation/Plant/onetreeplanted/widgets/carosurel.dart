import 'package:Greeneva/ui/Donation/Plant/onetreeplanted/data.dart';
import 'package:Greeneva/ui/Donation/Plant/onetreeplanted/screen1.dart';
import 'package:Greeneva/ui/Donation/Plant/onetreeplanted/widgets/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'dart:convert';

Future<List<TreeInfo>> fetchGoals(http.Client client) async {
  final response =
      await client.get('https://sdgfortb.herokuapp.com/api/onetreeplanted');

  // Use the compute function to run parseGoalss in a separate isolate.
  print(response.body);
  print(parseGoalss);
  print(response.statusCode);
  return compute(parseGoalss, response.body);
}

// A function that converts a response body into a List<TreeInfo>.
List<TreeInfo> parseGoalss(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//  print(parsed);
  return parsed.map<TreeInfo>((json) => TreeInfo.fromJson(json)).toList();
}

class Loading1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool country;

    return FutureBuilder<List<TreeInfo>>(
      future: fetchGoals(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? Carousel(tree: snapshot.data)
            : Scaffold(
                body: Container(
                    child: Center(
                        child: CircularProgressIndicator(
                backgroundColor: Colors.greenAccent,
              ))));
      },
    );
  }
}

class Carousel extends StatefulWidget {
  var tree;

  Carousel({this.tree});

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  // @override
  // void initState() {
  // ignore: todo
  //   // TODO: implement initState
  //   setState(() {
  //     showonet = false;
  //   });
  //   super.initState();
  // }

  bool viewVisible = false;

  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // bool showonet = false;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Plant With Us'),
        backgroundColor: Colors.accents[3],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Center(
              child: CupertinoButton(
                color: Colors.amber,
                child: Text('Plant With OneTreePlanted'),
                onPressed: !viewVisible ? showWidget : hideWidget,
              ),
            ),
            // print(showonet),
            Visibility(
                visible: viewVisible, child: Carousel1(tree: widget.tree))
          ],
        ),
      ),
    );
  }
}

class Carousel1 extends StatelessWidget {
  List<TreeInfo> tree;

  Carousel1({this.tree});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12,
                ),
                Text(
                  'Select Where To Plant',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 12)

                // GestureDetector(
                //   onTap: () => print('See All'),
                //   child: Text(
                //     'See All',
                //     style: TextStyle(
                //       color: Theme.of(context).primaryColor,
                //       fontSize: 16.0,
                //       fontWeight: FontWeight.w600,
                //       letterSpacing: 1.0,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            height: 300.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (BuildContext context, int index) {
                Destination destination = destinations[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoadingOP(
                        destination: destination.city,
                      ),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    width: 210.0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 15.0,
                          child: Container(
                            height: 120.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${destination.city}',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  // Text(
                                  //   '',
                                  //   // destination.description,
                                  //   style: TextStyle(
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: <Widget>[
                              Hero(
                                tag: destination.imageUrl,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image(
                                    height: 180.0,
                                    width: 180.0,
                                    image: NetworkImage(destination.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10.0,
                                bottom: 10.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      destination.city,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.add,
                                          size: 10.0,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 5.0),
                                        Text(
                                          '',
                                          // destination.country,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
