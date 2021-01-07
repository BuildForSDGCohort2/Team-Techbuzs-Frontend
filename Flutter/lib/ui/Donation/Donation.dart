import 'package:Greeneva/models/org.dart';
import 'package:Greeneva/ui/Community/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';
import 'Plant/onetreeplanted/widgets/carosurel.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double rounded_container_height;

  DetailSliverDelegate(this.expandedHeight, this.rounded_container_height);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Stack(
        children: <Widget>[
          Hero(
            tag: "https://techbuzs.github.io/I/A.png",
            child: Image.network(
              "https://techbuzs.github.io/I/A.png",
              width: MediaQuery.of(context).size.width,
              height: expandedHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: expandedHeight - rounded_container_height - shrinkOffset,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: rounded_container_height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
            top: expandedHeight - 120 - shrinkOffset,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Donate to Help the Global Goals!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class Donation extends StatefulWidget {
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  var spinkit = SpinKitRotatingCircle(
    color: Colors.white,
    size: 50.0,
  );
  final double expanded_height = 200;

  final double rounded_container_height = 50;
  int current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget _buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        expanded_height,
        rounded_container_height,
      ),
    );
  }

  Widget _buildDetail() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Organizations',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: map<Widget>(
                    datas,
                    (index, selected) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        height: 9,
                        width: 9,
                        margin: EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: current == index
                                ? kBlueColor
                                : kTwentyBlueColor),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 130,
            child: ListView.builder(
              itemCount: datas.length,
              padding: EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => index == 0
                                ? Loading1()
                                : index == 1
                                    ? Loading1()
                                    : index == 2
                                        ? Loading1()
                                        : Loading1()));
                  },
                  child: OperationCard(
                      onP: () {},
                      operation: datas[index].name,
                      selectedIcon: datas[index].selectedIcon,
                      context: this),
                );
              },
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              _buildSliverHead(),
              SliverToBoxAdapter(
                child: _buildDetail(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//pk_live_b45cc4b29a81090d3ecb50b74cc4797d3893e840
class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final Function onP;
  final _DonationState context;

  OperationCard(
      {this.operation,
      this.selectedIcon,
      this.unselectedIcon,
      this.context,
      this.onP});

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onP,
      child: Container(
        margin: EdgeInsets.only(right: 16),
        width: 130,
        height: 130,
        decoration: BoxDecoration(boxShadow: [
          // BoxShadow(
          //   color: kTenBlackColor,
          //   blurRadius: 10,
          //   spreadRadius: 5,
          //   offset: Offset(8.0, 8.0),
          // )
        ], borderRadius: BorderRadius.circular(15), color: kTenBlackColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              widget.selectedIcon,
              height: 85,
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              widget.operation,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: kBlackColor),
            )
          ],
        ),
      ),
    );
  }
}
