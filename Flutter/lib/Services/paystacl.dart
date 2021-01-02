import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

String backendUrl = 'https://sdgfortb.herokuapp.com/paystack';
// Set this to a public key that matches the secret key you supplied while creating the heroku instance
String paystackPublicKey = 'pk_live_b45cc4b29a81090d3ecb50b74cc4797d3893e840';
String kTpaystackPublicKey = 'pk_test_fbb50baa301b6d403f5c13b678a638c57e652061';

const String appName = 'Paystack Example';

class LocalPayment extends StatefulWidget {
  final double amount;
  final String quantity;
  final bool isrecurring;
  final int treeplanted;

  const LocalPayment({
    Key key,
    this.amount,
    this.quantity,
    this.isrecurring,
    this.treeplanted,
  }) : super(key: key);
  @override
  _LocalPaymentState createState() => _LocalPaymentState();
}

class _LocalPaymentState extends State<LocalPayment> {
  @override
  void initState() {
    PaystackPlugin.initialize(publicKey: paystackPublicKey);
    super.initState();
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  static const _method = ["Card", "Bank"];
  bool _inProgress = false;
  String _selected = "";
  void _showViewMain() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 350.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Center(
                    child: Column(
                  children: [
                    InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Checkout Method',
                          labelStyle: Theme.of(context)
                              .primaryTextTheme
                              .caption
                              .copyWith(color: Colors.black),
                          border: const OutlineInputBorder(),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              isExpanded: true,
                              isDense:
                                  true, // Reduces the dropdowns height by +/- 50%
                              icon: Icon(Icons.keyboard_arrow_down),
                              value: _selected,
                              items: _method.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (selectedItem) {
                                setState(
                                  () => _selected = selectedItem,
                                );
                                _parseStringToMethod(selectedItem);

                                Navigator.pop(context);
                              }),
                        ))
                  ],
                ))),
          );
        });
  }

  _showMessage(String message,
      [Duration duration = const Duration(seconds: 4)]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: new Text(message),
      duration: duration,
      action: new SnackBarAction(
          label: 'CLOSE',
          onPressed: () =>
              ScaffoldMessenger.of(context).removeCurrentSnackBar()),
    ));
  }

  CheckoutMethod _parseStringToMethod(String string) {
    CheckoutMethod method = CheckoutMethod.selectable;
    switch (string) {
      case 'Bank':
        method = CheckoutMethod.bank;
        break;
      case 'Card':
        method = CheckoutMethod.card;
        break;
    }
    return method;
  }

  _updateStatus(String reference, String message) {
    _showMessage('Reference: $reference \n\ Response: $message',
        const Duration(seconds: 7));
  }

  Future<String> _fetchAccessCodeFrmServer(String reference) async {
    var a = FirebaseAuth.instance.currentUser;
    var user = a.email;
    var name = a.displayName;

    String url =
        '$backendUrl/new-access-code?email=${user ?? "oreofesolarin@gmail.com"}&amount=${widget.amount}&name=${name ?? "No Name"}&reference=$reference';
    String accessCode;
    try {
      print("Access code url = $url");
      http.Response response = await http.get(url);
      accessCode = response.body;
      print('Response for access code = $accessCode');
    } catch (e) {
      setState(() => _inProgress = false);
      _updateStatus(
          reference,
          'There was a problem getting a new access code form'
          ' the backend: $e');
    }

    return accessCode;
  }

  _chargeCard(Charge charge) async {
    final response = await PaystackPlugin.chargeCard(context, charge: charge);

    final reference = response.reference;

    // Checking if the transaction is successful
    if (response.status) {
      _verifyOnServer(reference);
      return;
    }

    // The transaction failed. Checking if we should verify the transaction
    if (response.verify) {
      _verifyOnServer(reference);
    } else {
      setState(() => _inProgress = false);
      _updateStatus(reference, response.message);
    }
  }

  void _verifyOnServer(String reference) async {
    _updateStatus(reference, 'Verifying...');
    String url = '$backendUrl/verify/$reference';
    try {
      http.Response response = await http.get(url);
      var body = response.body;
      _updateStatus(reference, body);
    } catch (e) {
      _updateStatus(
          reference,
          'There was a problem verifying %s on the backend: '
          '$reference $e');
    }
    setState(() => _inProgress = false);
  }

  String isR() {
    if (widget.isrecurring == true) {
      return "will be a recurring payment every month. You can choose to cancel it at anytime.";
    } else {
      return "will be charged once.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Image.asset("assets/plant.gif"),
          Container(
            child: Text(
              "You want to plant ${widget.quantity} of ${widget.treeplanted} plants, this would cost ${widget.amount}. And this ${isR()} ",
              style: GoogleFonts.inter(
                fontSize: 28,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () => _showViewMain(),
            color: Colors.green,
            child: Text("Continue Now"),
          ),
          _selected == ""
              ? SizedBox(
                  height: 0,
                )
              : MaterialButton(
                  onPressed: () async {
                    Charge charge = Charge();

                    charge.accessCode =
                        await _fetchAccessCodeFrmServer(_getReference());
                    _chargeCard(charge);
                  },
                  child: Text("Checkout"),
                  color: Colors.red,
                )
        ],
      ),
    );
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }
}
