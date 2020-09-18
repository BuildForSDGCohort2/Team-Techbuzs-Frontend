import 'package:Greeneva/ui/intro_screen.dart';
import 'package:Greeneva/viewmodels/login_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}

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
                  onPressed: () {
                    signInWithGoogle().whenComplete(() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return OnBoardingPage();
                          },
                        ),
                      );
                    });
                  },
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
                            fontSize: 20),
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
                            fontSize: 20),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                !(LoginViewModel().busy)
                    ? IconButton(
                        icon: Icon(Icons.slideshow),
                        onPressed: () => LoginViewModel().facebooklogin(),
                      )
                    : Center(child: CircularProgressIndicator()),
                SizedBox(
                  width: 100,
                ),
                // CircleButton(
                //   icon: MdiIcons.twitter,
                //   iconSize: 50,
                //   onPressed: () {},
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
