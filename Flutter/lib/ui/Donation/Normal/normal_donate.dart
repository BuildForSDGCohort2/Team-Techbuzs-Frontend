import 'dart:convert';

import 'package:Greeneva/Services/paystacl.dart';
import 'package:Greeneva/ui/Discover/discover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String vrate;
double car;
String country;
double me;

class Donate extends StatefulWidget {
  final String org;
  final String meta;

  const Donate({Key key, this.org, this.meta}) : super(key: key);

  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  @override
  void initState() {
    super.initState();
    lookupUserCountry();
    print(country);
    _doConversion();
  }

  Future<String> lookupUserCountry() async {
    final response = await http.get('https://api.ipregistry.co?key=tryout');

    if (response.statusCode == 200) {
      print(json.decode(response.body)['location']['country']['name']);
      setState(() {
        country = json.decode(response.body)['location']['country']['name'];
      });
      return country;
    } else {
      throw Exception('Failed to get user country from IP address');
    }
  }

  Future<String> _doConversion() async {
    String uri =
        "https://api.currencyfreaks.com/latest?apikey=845e68ba6781496883d437f02f804886";
    var response = await http
        .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    print(responseBody);
    setState(() {
      vrate = responseBody["rates"]["NGN"].toString();

      print("$vrate is it");
      vrate = vrate.substring(0, 3);
      car = double.parse(vrate);
      print("$vrate is it");

      assert(car is double);
    });
    return "Success";
  }

  String price;
  TextEditingController _price = TextEditingController();
  String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donate"),
      ),
      body: country == ""
          ? spinkit
          : Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text("Donate To ${widget.org} Organization"),
                SizedBox(
                  height: 20,
                ),
                Text(" ${widget.meta} "),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true, signed: true),
                    controller: _price,
                    onChanged: (text) {
                      _price.text = moneyFormat(_price.text);

                      // me = double.parse("400.00");
                    },
                  ),
                ),
                country == "Nigeria"
                    ? Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "₦" + (car * me + (.10 * (car * me))).toString(),
                          textAlign: TextAlign.right,
                          // style: ,
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "\$" + (me + (.10 * (me))).toString(),
                          textAlign: TextAlign.right,
                          // style: ,
                        ),
                      ),
                SizedBox(height: 30),
                CupertinoButton(
                    child: Text("Donate"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => LocalPayment(
                                  amount: (car * me + (.10 * (car * me))),
                                  donation: "This is a Donation of  ₦" +
                                      (car * me + (.10 * (car * me)))
                                          .toString() +
                                      "For ${widget.org}. ${widget.meta} ")));
                    })
              ],
            ),
    );
  }
}
