import 'package:Greeneva/ui/Donation/Plant/onetreeplanted/data.dart';
import 'package:Greeneva/ui/Donation/Plant/onetreeplanted/pop.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
// import 'package:greenhorizon/Plant/onetreeplanted/screen1.dart';
import 'dart:convert';

Future<List<TreeInfo>> fetchGoals(http.Client client) async {
  final response =
      await client.get('https://sdgfortb.herokuapp.com/api/onetreeplanted');

  // Use the compute function to run parseGoalss in a separate isolate.
  // print(response.body);
  // print(parseGoalss);
  // print(response.statusCode);
  return compute(parseGoalss, response.body);
}

// A function that converts a response body into a List<TreeInfo>.
List<TreeInfo> parseGoalss(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//  print(parsed);
  return parsed.map<TreeInfo>((json) => TreeInfo.fromJson(json)).toList();
}

class LoadingOP extends StatelessWidget {
  final String destination;

  LoadingOP({this.destination});
  @override
  Widget build(BuildContext context) {
    // bool country;

    return FutureBuilder<List<TreeInfo>>(
      future: fetchGoals(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? DetailP(
                info: 1 == 2
                    ? snapshot.data.where((goals) {
                        print(destination);
                        // ignore: unnecessary_statements
                        // goals.region == 'North America';
                        var noteTitle = goals.region;
                        return noteTitle.contains(
                            goals.region == 'Africa' ? 'Africa' : destination);
                      }).toList()
                    : snapshot.data,
                destination: destination,
              )
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

class DetailP extends StatefulWidget {
  final String destination;
  final List<TreeInfo> info;
//  final  List<TreeInfo> _notesForDisplay = List<TreeInfo>();
//  final  List<TreeInfo> _notes = List<TreeInfo>();

  DetailP({this.info, this.destination});

  @override
  _DetailPState createState() => _DetailPState();
}

class _DetailPState extends State<DetailP> {
  // ignore: unused_field
  // ignore: deprecated_member_use
  // ignore: unused_field
  // ignore: deprecated_member_use
  // ignore: unused_field
  // ignore: deprecated_member_use
  List<TreeInfo> _notesForDisplay = List<TreeInfo>();
  // ignore: deprecated_member_use
  List<TreeInfo> _notes = List<TreeInfo>();

  // ignore: unused_element
  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: 'Search...'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _notesForDisplay = _notes.where((note) {
              var noteTitle = note.region.toLowerCase();
              return noteTitle.contains('North America');
            }).toList();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width - 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.vertical(),
                    // // borderRadius: BorderRadius.(30.0),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black26,
                    //     offset: Offset(0.0, 2.0),
                    //     blurRadius: 6.0,
                    //   ),
                    // ],
                    ),
                child: Hero(
                  tag: widget.destination == "North America"
                      ? 'https://techbuzs.github.io/OTP/North.jpg'
                      : widget.destination == "Latin America"
                          ? 'https://techbuzs.github.io/OTP/Latin.jpg'
                          : widget.destination == 'Africa'
                              ? 'https://techbuzs.github.io/OTP/Africa.jpg'
                              : widget.destination == 'Asia'
                                  ? 'https://techbuzs.github.io/OTP/Asia.jpg'
                                  : widget.destination == 'Europe'
                                      ? "https://techbuzs.github.io/OTP/Europe.jpg"
                                      : widget.destination == "The Pacific"
                                          ? "https://techbuzs.github.io/OTP/pacific.png"
                                          : "https://techbuzs.github.io/OTP/USDA.jpg",
                  child: Container(
                    constraints: BoxConstraints(
                        // maxWidth: 250.0,
                        // maxHeight: 1,
                        ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(30),
                        bottomRight: const Radius.circular(30),
                      ),
                      child: Image(
                        // height: 30,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        },
                        image: NetworkImage(
                          widget.destination == "North America"
                              ? 'https://techbuzs.github.io/OTP/North.jpg'
                              : widget.destination == "Latin America"
                                  ? 'https://techbuzs.github.io/OTP/Latin.jpg'
                                  : widget.destination == 'Africa'
                                      ? 'https://techbuzs.github.io/OTP/Africa.jpg'
                                      : widget.destination == 'Asia'
                                          ? 'https://techbuzs.github.io/OTP/Asia.jpg'
                                          : widget.destination == 'Europe'
                                              ? "https://techbuzs.github.io/OTP/Europe.jpg"
                                              : widget.destination ==
                                                      "The Pacific"
                                                  ? "https://techbuzs.github.io/OTP/pacific.png"
                                                  : "https://techbuzs.github.io/OTP/USDA.jpg",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: <Widget>[
              //       IconButton(
              //         icon: Icon(Icons.arrow_back),
              //         iconSize: 30.0,
              //         color: Colors.black,
              //         onPressed: () => Navigator.pop(context),
              //       ),
              //       Row(
              //         children: <Widget>[
              //           IconButton(
              //             icon: Icon(Icons.search),
              //             iconSize: 30.0,
              //             color: Colors.black,
              //             onPressed: () => Navigator.pop(context),
              //           ),
              //           IconButton(
              //             icon: Icon(FontAwesomeIcons.sortAmountDown),
              //             iconSize: 25.0,
              //             color: Colors.black,
              //             onPressed: () => Navigator.pop(context),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.destination,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_pin,
                          size: 15.0,
                          color: Colors.white70,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          widget.destination,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25.0,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: widget.info.length,
              itemBuilder: (BuildContext context, int index) {
                // Activity activity = info[index];
                return Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, a, b) => NextP(
                                      trees: widget.info[index],
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 170.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 120.0,
                                    child: Text(
                                      widget.info[index].name,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        '',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                widget.info[index].country,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(''
                                        // activity.startTimes[0],
                                        ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(''
                                        // activity.startTimes[1],
                                        ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: Container(
                        // height: 110,
                        constraints: BoxConstraints(maxWidth: 110),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            widget.info[index].imagelink, fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },

                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
