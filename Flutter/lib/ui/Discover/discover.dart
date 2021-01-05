import 'dart:convert';

import 'package:Greeneva/models/goal_model.dart';
import 'package:Greeneva/ui/Discover/goalmain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

Future<List<Goals>> fetchGoals(http.Client client) async {
  final response = await client.get('https://sdgfortb.herokuapp.com/api/goals');

  // Use the compute function to run parseGoalss in a separate isolate.
  // print(response.body);
  // print(parseGoalss);
  // print(response.statusCode);
  return compute(parseGoalss, response.body);
}

List<Goals> parseGoalss(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//  print(parsed);
  return parsed.map<Goals>((json) => Goals.fromJson(json)).toList();
}

var spinkit = SpinKitRotatingCircle(
  color: Colors.red,
  size: 50.0,
);

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Goals>>(
      future: fetchGoals(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? Discover(goals: snapshot.data)
            : Center(child: spinkit);
      },
    );
  }
}

class Discover extends StatefulWidget {
  final List<Goals> goals;

  Discover({this.goals});
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  int _selectedPage = 0;
  @override
  void initState() {
    super.initState();
    // _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  _plantSelector(int index) {
    int col = int.parse("0xff" + "${widget.goals[index].color}");
    // int ficol

    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => GoalMain(goal: widget.goals[index]),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(col),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: widget.goals[index].position,
                      child: SizedBox(
                        height: 280.0,
                        width: 280.0,
                        child: FadeInImage.assetNetwork(
                          image: widget.goals[index].linkImage,
                          placeholder: widget.goals[index].iconImage,
                        ),
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.0,
                    right: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'GOAL',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          '${widget.goals[index].position.toString()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 30.0,
                    bottom: 40.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.goals[index].name.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          widget.goals[index].title.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 4.0,
              child: RawMaterialButton(
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.black,
                child: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () => print('Add to cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 60.0),
          children: <Widget>[
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Goals',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 500.0,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _selectedPage = index;
                  });
                },
                itemCount: widget.goals.length,
                itemBuilder: (BuildContext context, int index) {
                  return _plantSelector(index);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    widget.goals[_selectedPage].description.toString() ??
                        "Error",
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
