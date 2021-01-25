import 'dart:convert';
import 'dart:async';

import 'dart:io';
import 'dart:math';
import 'package:Greeneva/Services/email_service.dart';
import 'package:Greeneva/Services/firestore_service.dart';
import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

final user = FirebaseAuth.instance.currentUser;
// Set this to a public key that matches the secret key you supplied while creating the heroku instance
String paystackPublicKey = 'pk_live_b45cc4b29a81090d3ecb50b74cc4797d3893e840';
String kTpaystackPublicKey = 'pk_test_fbb50baa301b6d403f5c13b678a638c57e652061';

const String appName = 'Paystack Example';

class LocalPayment extends StatefulWidget {
  final double amount;
  final String location;
  final String quantity;
  final String donation;
  final bool isrecurring;
  final int treeplanted;

  const LocalPayment({
    Key key,
    this.amount,
    this.quantity,
    this.donation,
    this.isrecurring,
    this.treeplanted,
    this.location,
  }) : super(key: key);
  @override
  _LocalPaymentState createState() => _LocalPaymentState();
}

class _LocalPaymentState extends State<LocalPayment> {
  ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    PaystackPlugin.initialize(publicKey: paystackPublicKey);
    super.initState();
    getDeviceinfo();
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  DeviceInfoPlugin deviceInfo =
      DeviceInfoPlugin(); // instantiate device info plugin
  AndroidDeviceInfo androidDeviceInfo;
  String board,
      brand,
      device,
      hardware,
      host,
      id,
      manufacture,
      model,
      product,
      type,
      androidid;
  bool isphysicaldevice;
  // final _scaffoldKey = new GlobalKey<ScaffoldState>();
  void getDeviceinfo() async {
    androidDeviceInfo = await deviceInfo
        .androidInfo; // instantiate Android Device Infoformation
    setState(() {
      board = androidDeviceInfo.board;
      brand = androidDeviceInfo.brand;
      device = androidDeviceInfo.device;
      hardware = androidDeviceInfo.hardware;
      host = androidDeviceInfo.host;
      id = androidDeviceInfo.id;
      manufacture = androidDeviceInfo.manufacturer;
      model = androidDeviceInfo.model;
      product = androidDeviceInfo.product;
      type = androidDeviceInfo.type;
      isphysicaldevice = androidDeviceInfo.isPhysicalDevice;
      androidid = androidDeviceInfo.androidId;
    });
  }

  static const _method = ["Card", "Bank"];
  // ignore: unused_field
  TextEditingController _email = TextEditingController();
  // ignore: unused_field
  bool _inProgress = false;
  String _selected = "Card";
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
                    // color: Colors.white,
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
                              dropdownColor: Colors.teal,
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
                        )),
                    TextFormField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Email"),
                    )
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
    Map map = {
      "email": user,
      "name": name,
      "reference": reference,
      "amount": widget.amount
    };
    String url = 'https://sdgfortb.herokuapp.com/paystack/new-access-code';
    String accessCode;
    try {
      print("Access code url = $url");
      var body = json.encode(map);

      http.Response response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);
      setState(() {
        accessCode = response.body;
      });
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

  String whatD() {
    if (widget.donation.contains("Tree")) {
      return "Plant A Tree";
    } else if (widget.donation.contains("Donation")) {
      return "Make A Donation to An NGO";
    }
    return "Donation";
  }

  String donat() {
    if (widget.donation.contains("Plant")) {
      return "This is a Payment Made Through Greeneva to $whatD()}. Thank You for participating to making the world a better Place";
    } else if (widget.donation.contains("Donation")) {
      return "This is a Payment Made Through Greeneva to $whatD()}. Thank You for participating to making the world a better Place. And Help the NGO ";
    }
    return "Donation";
  }

  void _verifyOnServer(String reference) async {
    _updateStatus(reference, 'Verifying...');
    String url = 'https://sdgfortb.herokuapp.com/paystack/verify/$reference';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            widget.donation.contains("Donation")
                ? SvgPicture.asset("assets/svgs/donate.svg")
                : SvgPicture.asset("assets/svgs/donate.svg"),
            // : Image.asset("assets/plant.gif"),
            Container(
              child: Text(
                widget.donation.contains("Donation")
                    ? widget.donation
                    : "You want to plant ${widget.quantity} packs of ${widget.treeplanted} Trees in ${widget.location}, this would cost ₦ ${widget.amount}. And this ${isR()} ",
                style: GoogleFonts.inter(
                  fontSize: 20,
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
                : CupertinoButton(
                    onPressed: () async {
                      // ...email =
                      CheckoutMethod method = CheckoutMethod.selectable;

                      if (_selected == "Bank") {
                        method = CheckoutMethod.bank;
                      } else {
                        method = CheckoutMethod.card;
                      }
                      var ref = _getReference();

                      var kaccessCode = await _fetchAccessCodeFrmServer(ref);

                      Charge charge = Charge()
                        ..amount = widget.amount.toInt()
                        ..accessCode = kaccessCode
                        ..email = user.email == null ? _email.text : user.email;
                      CheckoutResponse response = await PaystackPlugin.checkout(
                        context,
                        method: method, // Defaults to CheckoutMethod.selectable
                        charge: charge,
                      );
                      if (response.status == true) {
                        _verifyOnServer(ref);

                        print("_showDialog();");
                        await FirestoreService().addPayment(
                            user.uid,
                            "Local Payment Made by Paystack to ${whatD()}",
                            widget.donation,
                            widget.isrecurring,
                            widget.amount,
                            donat(),
                            "Brand: $brand , Device:  $device, Hardware: $hardware, Host: $host, Manufacture: $manufacture, Model: $model,  Is Physical Device: $isphysicaldevice");
                        await EmailService().sendtrans(
                            donat(),
                            user.email == null ? _email.text : user.email,
                            user.displayName,
                            widget.treeplanted.toString(),
                            widget.quantity,
                            widget.amount.toString(),
                            widget.donation == "" ? "Tree" : "Donation");
                        await EmailService().send(donat() + user.email == null
                            ? _email.text
                            : user.email +
                                        widget.treeplanted.toString() +
                                        widget.quantity +
                                        widget.amount.toString() +
                                        widget.donation ==
                                    ""
                                ? "Tree"
                                : "Donation");
                        _controllerBottomCenter.play();

                        /// SO A HAppy Dialog  TODO
                        ///
                      } else {
                        showGeneralDialog(
                          barrierLabel: "Label",
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: Duration(milliseconds: 700),
                          context: context,
                          pageBuilder: (context, anim1, anim2) {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 300,
                                child: SizedBox.expand(
                                    child: Column(
                                  children: [
                                    Text("An Error Occured"),
                                    CupertinoButton(
                                      child: Text("Try Again"),
                                      onPressed: () => Navigator.pop(context),
                                    )
                                  ],
                                )),
                                margin: EdgeInsets.only(
                                    bottom: 50, left: 12, right: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            );
                          },
                          transitionBuilder: (context, anim1, anim2, child) {
                            return SlideTransition(
                              position:
                                  Tween(begin: Offset(0, 1), end: Offset(0, 0))
                                      .animate(anim1),
                              child: child,
                            );
                          },
                        );
                        print(" _showErrorDialog(");
                      }
                    },
                    child: Text("Checkout"),
                    color: Colors.red,
                  ),
            Column(
              children: [
                Center(
                  child: Text("Thank You For The Donation ",
                      style:
                          GoogleFonts.inter(fontSize: 34, color: Colors.black)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ConfettiWidget(
                    confettiController: _controllerBottomCenter,
                    blastDirection: -pi / 2,
                    emissionFrequency: 0.01,
                    numberOfParticles: 20,
                    maxBlastForce: 100,
                    minBlastForce: 80,
                    gravity: 0.3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';

      return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}onTheGreenevaApp';
    }
    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}onTheGreenevaApp';
  }
}

class MyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Text(
        "CO",
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
