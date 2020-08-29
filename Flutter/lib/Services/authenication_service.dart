import 'dart:js';

import 'package:Greeneva/Services/analytics_service.dart';
import 'package:Greeneva/Services/firestore_service.dart';
import 'package:Greeneva/Services/locationJs.dart';
import 'package:Greeneva/locator.dart';
import 'package:Greeneva/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoder/geocoder.dart';
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

  success(pos) {
    try {
      print(pos.coords.latitude);

      lat = pos.coords.latitude;
      long = pos.coords.longitude;
      print(pos.coords.longitude);
    } catch (ex) {
      print("Exception thrown : " + ex.toString());
    }
  }

  _getCurrentLocation() {
    if (kIsWeb) {
      getCurrentPosition(allowInterop((pos) => success(pos)));
    }
  }

  Future<UserCredential> signInWithGoogle({String location}) async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final User user = _firebaseAuth.currentUser;
    if (kIsWeb) {
      // await _getCurrentLocation();
    }

    final coordinates = new Coordinates(lat, long);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    _currentUser = UserModel(
      id: user.uid,
      email: user.email,
      fullName: user.displayName,
      location: first.locality,
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

      await _firestoreService.createUser(_currentUser);
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
    var user = await _firebaseAuth.currentUser;
    await _populateCurrentUser(user);
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
