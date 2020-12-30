import 'package:Greeneva/ui/Community/constants/colors.dart';
import 'package:Greeneva/ui/Donation/Plant/onetreeplanted/data.dart';
import 'package:flutter/material.dart';

class Next1 extends StatelessWidget {
  final TreeInfo trees;

  const Next1({Key key, this.trees}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 300),
                        Text(
                          trees.name,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        // Text(
                        //   'Sustainable Development Goals',
                        //   style: TextStyle(
                        //     fontFamily: 'Avenir',
                        //     fontSize: 28,
                        //     color: primaryTextColor,
                        //     fontWeight: FontWeight.w300,
                        //   ),
                        //   textAlign: TextAlign.left,
                        // ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          trees.overview,
                          // maxLines: 8,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 17,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          trees.impact,
                          // maxLines: 8,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 17,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 34,
                        ),
                        Text(
                          trees.treespecies,
                          // maxLines: 8,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 17,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // GestureDetector(
                        //   child: Text(
                        //     'Read More',
                        //     textAlign: TextAlign.right,
                        //   ),
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       PageRouteBuilder(
                        //         pageBuilder: (context, a, b) => NextP(
                        //             // trees: goal[index].po,
                        //             ),
                        //       ),
                        //     );
                        //   },
                        // ),
                        SizedBox(height: 20),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'More Info',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.only(left: 32.0),
                    // child: Text(trees.description),
                    child: ListView.builder(
                        itemCount: trees.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  trees.images[index],
                                  fit: BoxFit.cover,
                                )),
                            // child: Container(),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -34,
              child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child:
                      Hero(tag: trees, child: Image.network(trees.imagelink))),
            ),
            Positioned(
              top: 60,
              left: 32,
              child: Text(
                trees.name,
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 247,
                  color: primaryTextColor.withOpacity(0.08),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
