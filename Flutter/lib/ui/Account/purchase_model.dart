import 'package:Greeneva/Services/authenication_service.dart';
import 'package:Greeneva/Services/dialog_service.dart';
import 'package:Greeneva/Services/firestore_service.dart';
import 'package:Greeneva/locator.dart';
import 'package:Greeneva/models/payment_model.dart';
import 'package:Greeneva/viewmodels/base_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';

final user = FirebaseAuth.instance.currentUser;

class PaymentVM extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
// >();
  final DialogServiceM _dialogService = locator<DialogServiceM>();

  // final DialogService _dialogService = locator<DialogService>();

  Map<String, dynamic> _payment;
  Map<String, dynamic> get payment => _payment;

  Future getPay() async {
    setBusy(true);
    var info = await _firestoreService.getPayments(user.uid);
    setBusy(false);

    if (true) {
      print(info.toString());
      _payment = info;
      notifyListeners();
    } else {
      await _dialogService.showDialog(
        title: 'Failed',
        description: info.toString() ?? "OP",
      );
    }
  }
}
