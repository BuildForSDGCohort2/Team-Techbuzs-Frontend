// import 'dart:js';

import 'package:Greeneva/Services/analytics_service.dart';
import 'package:Greeneva/Services/email_service.dart';
import 'package:Greeneva/Services/firestore_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:Greeneva/locator.dart';
import 'package:Greeneva/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();
  GoogleSignIn _googleSignIn = GoogleSignIn();

  String name;
  String imageUrl;
  var lat;
  var long;

  UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  Future logout() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<UserCredential> signInWithTwitter() async {
    var me;
    // Create a TwitterLogin instance
    final TwitterLogin twitterLogin = new TwitterLogin(
      consumerKey: 'pRsGZkKEgMFwbij8NgFcCgQi9',
      consumerSecret: 'fXSLtaBrdgBK6pikRLi96ILd3xKZZKxvlPh0xadCirR9fetoDX',
    );

    // Trigger the sign-in flow
    try {
      final TwitterLoginResult loginResult = await twitterLogin.authorize();
      final TwitterSession twitterSession = loginResult.session;

      // Create a credential from the access token
      final AuthCredential twitterAuthCredential =
          TwitterAuthProvider.credential(
              accessToken: twitterSession.token, secret: twitterSession.secret);
      me = await FirebaseAuth.instance
          .signInWithCredential(twitterAuthCredential);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance
          .signInWithCredential(twitterAuthCredential);
    } catch (e) {
      print(e);
    }
    return me;
    // Get the Logged In session
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithGoogle({String location}) async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final User user = _firebaseAuth.currentUser;
    _currentUser = UserModel(
      id: user.uid,
      email: user.email,
      fullName: user.displayName,
      location: "locality",
    );
    // Create a new credential
    try {
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      if (user != null) {
        await _firestoreService.createUser(_currentUser);
        await _analyticsService.setUserProperties(
          userId: user.uid,
          name: _currentUser.location,
        );
      }
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      return e.message;
    }
    // Once signed in, return the UserCredential
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String fullName,
    @required String location,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      _currentUser = UserModel(
        id: authResult.user.uid,
        email: email,
        fullName: fullName,
        location: location,
      );

      FirebaseAuth.instance.currentUser != null
          ? FirebaseAuth.instance.currentUser
              .updateProfile(displayName: fullName)
          // ignore: unnecessary_statements
          : {};
      await _firestoreService.createUser(_currentUser);
      _firebaseAuth.currentUser != null
          ? await _firebaseAuth.currentUser.sendEmailVerification()
          // ignore: unnecessary_statements
          : {};
      EmailService().sendtrans('Thank You for Creating an Account ',
          email != null ? email : authResult.user.email, name);
      await _analyticsService.setUserProperties(
        userId: authResult.user.uid,
        name: _currentUser.location,
      );

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    //await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
      await _analyticsService.setUserProperties(
        userId: user.uid,
        name: _currentUser.location,
      );
    }
  }
}
