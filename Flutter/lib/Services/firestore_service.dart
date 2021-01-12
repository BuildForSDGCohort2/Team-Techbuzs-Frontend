import 'dart:async';

import 'package:Greeneva/models/payment_model.dart';
import 'package:Greeneva/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/services.dart';

class FirestoreService {
  /*
  
  {
    "payment_0":{

    },
    "payment_1":{

    }
  }

  */
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _paymentCollectionReference =
      FirebaseFirestore.instance.collection('payments');
  Future addPayment(
      String uid,
      String paymentType,
      // String treePlanted,
      String donation,
      bool isRecurring,
      double amount,
      String description,
      String deviceInfo) async {
    try {
      var qs = await _paymentCollectionReference
          .doc("Tj5K5VWuyvhjwKO5GmJQGyUCr3i2")
          .get();
// final  snaps = _paymentCollectionReference.doc(uid).get();

      if (qs == null || !qs.exists) {
        // paymentType.contains("Plant")
        await _paymentCollectionReference.doc(uid).set({
          "payment_0": {
            "uid": uid,
            "paymentType": paymentType,
            "donation": donation,
            "description": description,
            "amount": amount,
            "deviceInfo": deviceInfo,
            "isRecurring": isRecurring
          }
        });
      } else {
        if (qs.data().length > 0) {
          await _paymentCollectionReference.doc(uid).update({
            "payment_${((qs.data().length)).toString()}": {
              "uid": uid,
              "paymentType": paymentType,
              "donation": donation,
              "description": description,
              "amount": amount,
              "deviceInfo": deviceInfo,
              "isRecurring": isRecurring
            }
          });
        }
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future getPayments(String uid) async {
    try {
      var done;
      // var userData = await _paymentCollectionReference
      //     .doc("Tj5K5VWuyvhjwKO5GmJQGyUCr3i2")
      //     .get();
      final DocumentReference document = FirebaseFirestore.instance
          .collection("payments")
          .doc('Tj5K5VWuyvhjwKO5GmJQGyUCr3i2');
      await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
        //  setState(() {
        //    data =snapshot.data;
        //  });
        print(snapshot.data().toString());
        done = snapshot.data();
        return done;
      });
      return done;
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future createUser(UserModel user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();
      return UserModel.fromData(userData.data());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }
}
