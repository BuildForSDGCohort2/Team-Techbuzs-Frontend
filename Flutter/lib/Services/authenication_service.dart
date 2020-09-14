import 'package:Greeneva/Services/analytics_service.dart';
import 'package:Greeneva/Services/email_service.dart';
import 'package:Greeneva/Services/firestore_service.dart';
import 'package:Greeneva/locator.dart';
import 'package:Greeneva/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();

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

  /// I'm calling This because I don't like the 50+ Warning about Syntax Error and Blabala.
  /// This does not do any foo  !!!!
  void nothing() {
    print('This Does Nothing LOL :)');
  }

  Future<UserCredential> signInWithTwitter() async {
    // Create a new provider
    TwitterAuthProvider twitterProvider = TwitterAuthProvider();

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(twitterProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(twitterProvider);
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

  Future<UserCredential> signInWithFacebook() async {
    // Create a new provider
    FacebookAuthProvider facebookProvider = FacebookAuthProvider();

    facebookProvider.addScope('email');
    facebookProvider.setCustomParameters({
      'display': 'popup',
    });

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(facebookProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(facebookProvider);
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
      location: 'first.locality',
    );
    // Create a new credential

    try {
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      if (user != null) {
        await _firestoreService.checkIfUserExist(user.uid)
            ? nothing()
            : await _firestoreService.createUser(_currentUser);
        // : nothing();

        await _firestoreService.checkIfUserExist(user.uid)
            ? nothing()
            : await EmailService().sendEmail(
                'Thank You for Creating an Account ',
                _currentUser.email != null ? _currentUser.email : user.email,
                name);
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
      final User user = _firebaseAuth.currentUser;
      await user.sendEmailVerification();
      await EmailService().sendEmail('Thank You for Creating an Account ',
          email != null ? email : authResult.user.email, name);

      await _firestoreService.createUser(_currentUser);
      await updateUserName(fullName, user);
      await _analyticsService.setUserProperties(
        userId: authResult.user.uid,
        name: _currentUser.location,
      );

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future updateUserName(String name, User currentUser) async {
    // var userUpdateInfo = User();
    // userUpdateInfo.displayName = name;
    await currentUser.updateProfile(displayName: name);
    await currentUser.reload();
  }

  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
      // await _analyticsService.setUserProperties(
      //   userId: user.uid,
      //   name: _currentUser.location,
      // );
    }
  }
}
