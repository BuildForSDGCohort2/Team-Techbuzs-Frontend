// import 'package:Greeneva/locator.dart';
// import 'package:Greeneva/models/payment_model.dart';
import 'package:Greeneva/ui/Account/purchase_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:Greeneva/Services/firestore_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

final user = FirebaseAuth.instance.currentUser;

class Purchases extends StatefulWidget {
  @override
  _PurchasesState createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  // final FirestoreService _firestoreService = locator<FirestoreService>();

  // var result = await _firestoreService.getPayments(user.uid);
  var spinkit = SpinKitChasingDots(
    color: Colors.teal,
  );
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentVM>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Payment History"),
        ),
        body: Column(
          children: [
            Expanded(
                child: model.payment != null
                    ? ListView.builder(
                        itemCount: model.payment.length,
                        itemBuilder: (context, index) =>
                            PostItem(pay: model.payment["payment_$index"]),
                      )
                    : Center(
                        child: Column(
                        children: [
                          Center(child: spinkit),
                          Text("No Payment Has been made")
                        ],
                      )))
          ],
        ),
      ),
      viewModelBuilder: () => PaymentVM(),
      onModelReady: (model) => model.getPay(),
    );
  }
}

class PostItem extends StatelessWidget {
  final dynamic pay;
  const PostItem({
    Key key,
    this.pay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String res() {
      if (pay["isRecurring"] == true) return "Yes";

      return "NO";
    }

    return Container(
      height: 120,
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("User Code: " + pay["uid"] ?? "errpor",
                style: TextStyle(color: Colors.black)),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Amount: " + pay["amount"].toString() ?? "error",
                style: TextStyle(color: Colors.black)),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Description: " + pay["description"] ?? "error",
                style: TextStyle(color: Colors.black)),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Donation: " + pay["donation"] ?? "error",
                style: TextStyle(color: Colors.black)),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Payment Type: " + pay["paymentType"] ?? "error",
                style: TextStyle(color: Colors.black)),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Payment Recurring: " + res(),
                style: TextStyle(color: Colors.black)),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Device Info: " + pay["deviceInfo"],
                style: TextStyle(color: Colors.black)),
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
