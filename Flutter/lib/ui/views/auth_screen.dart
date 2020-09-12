import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Text(
                'Welcome',
                style: GoogleFonts.cormorantUpright(
                    color: Color(0xff4A69FF), fontSize: 45),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                child: MaterialButton(
                  onPressed: () {},
                  height: 70,
                  // minWidth: length / 2,
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
              height: 29,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                child: MaterialButton(
                  onPressed: () {},
                  height: 70,
                  // minWidth: length / 2,
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
                      ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                // CircleButton(
                //     icon: MdiIcons.facebook,
                //     iconSize: 50,
                //     onPressed: () {},
                //   ),
                //   SizedBox(
                //     width: 100,
                //   ),
                //   CircleButton(
                //     icon: MdiIcons.twitter,
                //     iconSize: 50,
                //     onPressed: () {},
                //   )
              ],
            )
          ],
        ),
      ),
    );
  }
}
