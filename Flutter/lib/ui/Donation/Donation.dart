import 'package:Greeneva/models/org.dart';
import 'package:Greeneva/ui/Community/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Donation extends StatefulWidget {
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  var spinkit = SpinKitRotatingCircle(
    color: Colors.white,
    size: 50.0,
  );
  int current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Donate to Help the Global Goals!",
                style: GoogleFonts.inter(fontSize: 20, color: Colors.black)),
            Padding(
              padding:
                  EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 10),
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
                    onTap: () {},
                    child: OperationCard(
                        onP: () {},
                        operation: datas[index].name,
                        selectedIcon: datas[index].selectedIcon,
                        context: this),
                  );
                },
              ),
            ),
          ],
        ),
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
  _DonationState context;

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
