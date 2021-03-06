import 'package:Greeneva/Services/theme_provider.dart';
import 'package:Greeneva/models/org.dart';
import 'package:Greeneva/ui/Community/constants/colors.dart';
import 'package:Greeneva/ui/Donation/Normal/normal_donate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Plant/onetreeplanted/widgets/carosurel.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  // ignore: non_constant_identifier_names
  final double rounded_container_height;

  DetailSliverDelegate(this.expandedHeight, this.rounded_container_height);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final themeProvider = Provider.of<ThemeProvider>(context);

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
                color: themeProvider.isLightTheme
                    ? Colors.white
                    : Color(0xFF26242e),
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
                    fontSize: 25,
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
  // ignore: non_constant_identifier_names
  final double expanded_height = 200;

  // ignore: non_constant_identifier_names
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

  Widget viewtoShow(int index) {
    if (index == 0)
      return Donate(
          org: "TechBuzs NGO",
          meta:
              "This Donation will be used to Help The SDG #3 : Good Health and Well-being. The Donation will ensure healthy lives and promote well-being for all at all ages");
    if (index == 1) return Loading1();
    if (index == 2) return Loading1();
    if (index == 3)
      return Donate(
          org: "STANDUPTOCHILDABUSE",
          meta:
              "The Donation will be used to Help The SDG #16:  Peace, justice and strong institutions. The Donation is will help the NGO to continue their Work! ");
    return Loading1();
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
                    // color: themeProvider.isLightTheme ),
                  ),
                ),
                SizedBox(
                  height: 30,
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
                  child: OperationCard(
                      onP: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => viewtoShow(index)));
                      },
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
    final themeProvider = Provider.of<ThemeProvider>(context);

    return GestureDetector(
      onTap: widget.onP,
      child: Container(
        margin: EdgeInsets.only(right: 16),
        width: 130,
        height: 130,
        decoration: BoxDecoration(
            boxShadow: [
              // BoxShadow(
              //   color: kTenBlackColor,
              //   blurRadius: 10,
              //   spreadRadius: 5,
              //   offset: Offset(8.0, 8.0),
              // )
            ],
            borderRadius: BorderRadius.circular(15),
            color: themeProvider.isLightTheme ? kTenBlackColor : Colors.white),
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
                  color: !(themeProvider.isLightTheme)
                      ? Colors.black
                      : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
