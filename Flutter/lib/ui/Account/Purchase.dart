import 'package:Greeneva/locator.dart';
import 'package:Greeneva/models/payment_model.dart';
import 'package:Greeneva/ui/Account/purchase_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Greeneva/Services/firestore_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

final user = FirebaseAuth.instance.currentUser;

class Purchases extends StatefulWidget {
  @override
  _PurchasesState createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  // var result = await _firestoreService.getPayments(user.uid);
  var spinkit = SpinKitChasingDots(
    color: Colors.teal,
  );
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentVM>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: [
            Expanded(
                child: model.payment != null
                    ? ListView.builder(
                        itemCount: model.payment.length,
                        itemBuilder: (context, index) => PostItem(
                          pay: model.payment[index],
                        ),
                      )
                    : Center(child: spinkit))
          ],
        ),
      ),
      viewModelBuilder: () => PaymentVM(),
      onModelReady: (model) => model.getPay(),
    );
  }
}

class PostItem extends StatelessWidget {
  final Payment pay;
  const PostItem({
    Key key,
    this.pay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(pay.paymentType),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(pay.amount.toString()),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(pay.description),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(pay.donation),
          )),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(blurRadius: 8, color: Colors.grey[200], spreadRadius: 3)
          ]),
    );
  }
}
