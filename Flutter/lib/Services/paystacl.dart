import 'dart:convert';
import 'dart:async';

import 'dart:io';
import 'package:Greeneva/Services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

String backendUrl = 'http://192.168.1.117:8080/paystack';
final user = FirebaseAuth.instance.currentUser;
// Set this to a public key that matches the secret key you supplied while creating the heroku instance
String paystackPublicKey = 'pk_live_b45cc4b29a81090d3ecb50b74cc4797d3893e840';
String kTpaystackPublicKey = 'pk_test_fbb50baa301b6d403f5c13b678a638c57e652061';

const String appName = 'Paystack Example';

class LocalPayment extends StatefulWidget {
  final double amount;
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
  }) : super(key: key);
  @override
  _LocalPaymentState createState() => _LocalPaymentState();
}

class _LocalPaymentState extends State<LocalPayment> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  @override
  void initState() {
    PaystackPlugin.initialize(publicKey: kTpaystackPublicKey);
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    Map<String, dynamic> deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
  // final _scaffoldKey = new GlobalKey<ScaffoldState>();

  static const _method = ["Card", "Bank"];
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
    Map map = {
      "email": "oreofesolarin@gmail.com",
      "name": name,
      "reference": reference,
      "amount": widget.amount
    };
    String url = 'http://192.168.1.117:8080/paystack/new-access-code';
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

  _chargeCard(Charge charge) async {
    final response = await PaystackPlugin.chargeCard(context, charge: charge);

    final reference = response.reference;

    // Checking if the transaction is successful
    if (response.status) {
      _verifyOnServer(reference);
      FirestoreService().addPayment(
          user.uid,
          "Local Payment Made by Paystack to ${whatD()}",
          widget.donation,
          widget.isrecurring,
          widget.amount,
          donat(),
          "");
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
    String url = 'http://192.168.1.117:8080/paystack/verify/$reference';
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
              : CupertinoButton(
                  onPressed: () async {
                    // ...email =
                    CheckoutMethod method = CheckoutMethod.selectable;

                    if (_selected == "Bank") {
                      method = CheckoutMethod.bank;
                    } else {
                      method = CheckoutMethod.card;
                    }

                    var kaccessCode =
                        await _fetchAccessCodeFrmServer(_getReference());

                    Charge charge = Charge()
                      ..amount = widget.amount.toInt()
                      ..accessCode = kaccessCode
                      ..email = "oreofesolarin@gmail.com";
                    CheckoutResponse response = await PaystackPlugin.checkout(
                      context,
                      method: method, // Defaults to CheckoutMethod.selectable
                      charge: charge,
                    );
                    if (response.status == true) {
                      print("_showDialog();");
                      await FirestoreService().addPayment(
                          user.uid,
                          "Local Payment Made by Paystack to ${whatD()}",
                          widget.donation,
                          widget.isrecurring,
                          widget.amount,
                          donat(),
                          "");
                    } else {
                      print(" _showErrorDialog(");
                    }
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

      return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}onTheGreenevaApp';
    }
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
