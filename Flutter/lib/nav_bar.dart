import 'package:Greeneva/ui/views/Account/account_page.dart';
import 'package:Greeneva/ui/views/Contacts/contact_page.dart';
import 'package:Greeneva/ui/views/Donate/donate_page.dart';
import 'package:Greeneva/ui/views/Info/help_page.dart';
import 'package:Greeneva/ui/views/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Color(0xfffafafa),
              // elevation: 0.0,
              actions: [
                Text(
                  'Greeneva.',
                  style: GoogleFonts.merriweatherSans(
                      color: Color(0xff4A69FF), fontSize: 16),
                ),
              ],
              title: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: CircleTabIndicator(color: Colors.green, radius: 4),
                  tabs: [
                    Text(
                      'Greeneva.',
                      style: GoogleFonts.merriweatherSans(
                          color: Color(0xff4A69FF), fontSize: 16),
                    ),
                    Row(
                      children: [
                        // SizedBox(
                        //   width: 100,
                        // ),
                        Text(
                          "Home".toUpperCase(),
                          style: GoogleFonts.merriweatherSans(
                              color: Color(0xff4A69FF),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      "Help".toUpperCase(),
                      style: GoogleFonts.merriweatherSans(
                          color: Color(0xff4A69FF),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Donate".toUpperCase(),
                      style: GoogleFonts.merriweatherSans(
                          color: Color(0xff4A69FF),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Contact".toUpperCase(),
                      style: GoogleFonts.merriweatherSans(
                          color: Color(0xff4A69FF),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Account".toUpperCase(),
                      style: GoogleFonts.merriweatherSans(
                          color: Color(0xff4A69FF),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ])),
          body: TabBarView(
            children: [
              HomePage(),
              HelpPage(),
              DonatePage(),
              ContactPage(),
              AccountPage(),
            ],
          ),
        ));
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
