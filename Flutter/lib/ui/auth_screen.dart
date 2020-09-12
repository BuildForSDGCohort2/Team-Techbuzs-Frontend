import 'package:Greeneva/ui/cicle_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    var length = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(width);
    print((width * .4452083333));
    bool ishome = true;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: !(width < 710)
            ? Row(
                children: [
                  SizedBox(width: width / 17),
                  Text(
                    'Greeneva.',
                    style: GoogleFonts.merriweatherSans(
                        color: Color(0xff4A69FF), fontSize: 16),
                  ),

                  // Center(
                  //       child: Text(
                  //     '.',
                  //       )),
                  !(width < 1314)
                      ? SizedBox(width: (width / 2.4))
                      : !(width < 500)
                          ? SizedBox(width: (width / 7))
                          : SizedBox(width: (width / 25)),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => !ishome,
                        child: Text(
                          'Home'.toUpperCase(),
                          style: GoogleFonts.merriweatherSans(
                              color: Color(0xff4A69FF),
                              fontSize: 16,
                              // letterSpacing: .8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ishome
                          ? Icon(
                              Icons.ac_unit_rounded,
                              color: Colors.green,
                              size: 10,
                            )
                          : {},
                    ],
                  ),
                  SizedBox(width: (width / 20)),
                  Text(
                    'Help'.toUpperCase(),
                    style: GoogleFonts.merriweatherSans(
                        color: Color(0xff4A69FF),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: (width / 20)),
                  Text(
                    'Donate'.toUpperCase(),
                    style: GoogleFonts.merriweatherSans(
                        color: Color(0xff4A69FF),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: (width / 20)),
                  Text(
                    'Contact'.toUpperCase(),
                    style: GoogleFonts.merriweatherSans(
                        color: Color(0xff4A69FF),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: (width / 20)),
                  Text(
                    'Account'.toUpperCase(),
                    style: GoogleFonts.merriweatherSans(
                        color: Color(0xff4A69FF),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            : null,
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            // CircleTabIndicator(color: Colors.blue, radius: 4),
            SizedBox(
              height: length / 5,
            ),
            Center(
              child: Text(
                'Welcome',
                style: GoogleFonts.merriweatherSans(
                  fontSize: 50,
                  color: Color(0xff4A69FF),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Container(
                width: !(width < 1200)
                    ? width / 3.6
                    : !(width < 720)
                        ? width - (width - (width / 2))
                        : width - 100,
                child: MaterialButton(
                  onPressed: () {},
                  height: length / 10,
                  minWidth: length / 2,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Image.network(
                        'https://www.freepngimg.com/thumb/google/66893-guava-logo-google-plus-suite-png-image-high-quality.png',
                        height: 50,
                      ),
                      SizedBox(
                        width: 39,
                      ),
                      Center(
                          child: Text(
                        'Sign in with Google',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: !(width < 1200)
                    ? width / 3.6
                    : !(width < 720)
                        ? width - (width - (width / 2))
                        : width - 100,
                child: MaterialButton(
                  onPressed: () {},
                  height: length / 10,
                  minWidth: length / 2,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Image.network(
                        'https://www.freepngimg.com/thumb/google/66893-guava-logo-google-plus-suite-png-image-high-quality.png',
                        height: 50,
                      ),
                      SizedBox(
                        width: 39,
                      ),
                      Center(
                          child: Text(
                        'Sign in with Apple',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 39,
            ),
            Row(
              children: [
                SizedBox(
                  width: !(width < 720) ? width / 2.4 : width / 4,
                ),
                CircleButton(
                  icon: MdiIcons.facebook,
                  iconSize: 50,
                  onPressed: () {},
                ),
                SizedBox(
                  width: 100,
                ),
                CircleButton(
                  icon: MdiIcons.twitter,
                  iconSize: 50,
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: length / 7,
            ),
            GestureDetector(
              child: Center(
                child: Text(
                  'Continue With Email',
                  style: TextStyle(color: Color(0xff707070), fontSize: 20),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class CircleTabIndicator extends Container {
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
