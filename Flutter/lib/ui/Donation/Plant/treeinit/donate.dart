import 'package:Greeneva/Services/paystacl.dart';
import 'package:Greeneva/models/org.dart';
import 'package:Greeneva/ui/Community/constants/colors.dart';
import 'package:Greeneva/ui/Donation/Plant/onetreeplanted/data.dart';
import 'package:Greeneva/ui/Donation/Plant/onetreeplanted/more.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

int _itemCount = 1;
var treeplanted = "1";
int numberOfItems = 1;
var country = "";
var pfinal = int.parse(treeplanted) * numberOfItems;
String vrate;
double car;
bool isrecurring = false;

class DonateT extends StatefulWidget {
  final String trees;
  const DonateT({Key key, this.trees}) : super(key: key);

  @override
  _DonateTState createState() => _DonateTState();
}

class _DonateTState extends State<DonateT> {
  final double expanded_height = 400;
  List<String> currencies;
  String fromCurrency = "USD";
  String toCurrency = "NGN";
  String result;
  final double rounded_container_height = 50;
  Future<String> _loadCurrencies() async {
    String uri = "https://api.exchangeratesapi.io/latest";
    var response = await http
        .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    Map curMap = responseBody['rates'];
    currencies = curMap.keys.toList();
    setState(() {});
    print(currencies);
    return "Success";
  }

  Future<String> lookupUserCountry() async {
    final response = await http.get('https://api.ipregistry.co?key=tryout');

    if (response.statusCode == 200) {
      print(json.decode(response.body)['location']['country']['name']);
      setState(() {
        country = json.decode(response.body)['location']['country']['name'];
      });
      return country =
          json.decode(response.body)['location']['country']['name'];
    } else {
      throw Exception('Failed to get user country from IP address');
    }
  }

  @override
  void initState() {
    super.initState();
    lookupUserCountry();
    print(country);
    _doConversion();
  }

  Future<String> _doConversion() async {
    String uri =
        "https://api.currencyfreaks.com/latest?apikey=845e68ba6781496883d437f02f804886";
    var response = await http
        .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    print(responseBody);

    vrate = responseBody["rates"]["NGN"].toString();

    print("$vrate is it");
    vrate = vrate.replaceRange(5, vrate.length, "");
    setState(() {
      car = double.parse(vrate);
    });
    assert(car is double);

    return "Success";
  }

  var spinkit = SpinKitChasingDots(
    color: Colors.teal,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: country == ""
          ? spinkit
          : Stack(
              children: <Widget>[
                CustomScrollView(
                  slivers: <Widget>[
                    _buildSliverHead(),
                    SliverToBoxAdapter(
                      child: _buildDetail(),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                  child: SizedBox(
                    height: kToolbarHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }

  Widget _buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        expanded_height,
        widget.trees,
        rounded_container_height,
      ),
    );
  }

  Widget _item() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 10,
        ),

        // Image.asset("assets/flutter.png", width: 100),
        _decrementButton(),
        SizedBox(
          width: 15,
        ),
        Text(
          '$numberOfItems',
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        SizedBox(
          width: 15,
        ),

        _incrementButton(),
      ],
    );
  }

  Widget _incrementButton() {
    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.black87),
      backgroundColor: Colors.white,
      onPressed: () {
        setState(() {
          numberOfItems++;
        });
      },
    );
  }

  Widget _decrementButton() {
    return FloatingActionButton(
        onPressed: () {
          setState(() {
            numberOfItems--;
          });
        },
        child: new Icon(Icons.remove, color: Colors.black),
        backgroundColor: Colors.white);
  }

  Widget _buildDetail() {
    // var mymoney = vrate.toInt() * (7 * int.parse(treeplanted));
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "TREES PLANTED",
                  style: GoogleFonts.inter(fontSize: 21, color: Colors.black),
                ),
              ),
              TPlanted(
                onSelected: (tree) {
                  setState(() {
                    treeplanted = tree;
                  });
                  print(tree);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "QTY",
                  style: GoogleFonts.inter(fontSize: 21, color: Colors.black),
                ),
              ),
              _item(),
              Row(
                children: [
                  (country) == "Nigeria"
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("Price:   " +
                              "₦" +
                              (car *
                                          (numberOfItems *
                                              int.parse(treeplanted) *
                                              10) +
                                      (.10 *
                                          (car *
                                              (numberOfItems *
                                                  int.parse(treeplanted)))))
                                  .toString()
                                  .replaceAllMapped(
                                      new RegExp(
                                          r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                      (Match m) => '${m[1]},')),
                        )
                      : Text(
                          "\$" +
                              ((numberOfItems * int.parse(treeplanted) * 10) +
                                      (.10 *
                                          (car *
                                              (numberOfItems *
                                                  int.parse(treeplanted)))))
                                  .toString(),
                          style: TextStyle(color: Colors.black)),
                  SizedBox(
                    width: 30,
                  ),
                  CupertinoButton(
                    child: Text("Plant"),
                    color: Colors.teal,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => LocalPayment(
                                    amount: (car *
                                            (numberOfItems *
                                                int.parse(treeplanted) *
                                                10) +
                                        (.10 *
                                            (car *
                                                (numberOfItems *
                                                    int.parse(treeplanted))))),
                                    treeplanted: int.parse(treeplanted),
                                    quantity: numberOfItems.toString(),
                                    donation:
                                        "One Tree Planted To Plant A Tree",
                                    isrecurring: isrecurring,
                                  )));
                    },
                  )
                ],
              ),
            ],
          ),
          _buildUserInfo("Overview"),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Text(
              widget.trees == "North" ? datas[0].info : datas[1].info,
              style: TextStyle(
                color: Colors.black38,
                height: 1.4,
                fontSize: 14,
              ),
            ),
          ),
          _buildUserInfo("Tree Species"),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Text(
              "T.R.E.E. Initiative with the support and collaboration of donors and partners intends to float this project conceived by to mitigate the possible eventual extinction of the Shea Butter tree in Nigeria. This is because of the strategic importance of the Shea Butter tree in sustaining the livelihood of more than 1 million rural women across the Shea Belt in Nigeria.",
              style: TextStyle(
                color: Colors.black38,
                height: 1.4,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                info,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FeaturedWidget extends StatelessWidget {
  // List<TreeInfo> _list = ();
  final TreeInfo trees;
  FeaturedWidget({this.trees});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          height: 150,
          width: 150,
          margin: EdgeInsets.only(
            right: 15,
          ),
          child: Image.network(
            trees.images[index],
            fit: BoxFit.cover,
          ),
        );
      },
      itemCount: trees.images.length,
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String tree;
  final double rounded_container_height;

  DetailSliverDelegate(
      this.expandedHeight, this.tree, this.rounded_container_height);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Stack(
        children: <Widget>[
          Hero(
            tag: tree == "North"
                ? "https://cdn.britannica.com/33/146033-050-1F84E56E/Sahel-rain-season-Bamako-Mali-Kayes.jpg"
                : "https://4.bp.blogspot.com/-J9q05CGWSCE/VQtB3KTPHpI/AAAAAAAAHgQ/jmJrTuRB3vc/s1600/Roumsiki%2B(1).jpg",
            child: Image.network(
              tree == "North"
                  ? "https://cdn.britannica.com/33/146033-050-1F84E56E/Sahel-rain-season-Bamako-Mali-Kayes.jpg"
                  : "https://4.bp.blogspot.com/-J9q05CGWSCE/VQtB3KTPHpI/AAAAAAAAHgQ/jmJrTuRB3vc/s1600/Roumsiki%2B(1).jpg",
              width: MediaQuery.of(context).size.width,
              height: expandedHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: expandedHeight - rounded_container_height - shrinkOffset,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: rounded_container_height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
            top: expandedHeight - 120 - shrinkOffset,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tree == "North" ? "North Region" : "Southern",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text(
                  tree == "North"
                      ? "Northern" + "," + "Nigeria"
                      : "Southern" + "," + "Nigeria",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class TPlanted extends StatefulWidget {
  // final List TPlanteds;
  final Function(String) onSelected;
  TPlanted({this.onSelected});

  @override
  _TPlantedState createState() => _TPlantedState();
}

class _TPlantedState extends State<TPlanted> {
  int _selected = 0;
  var planted = ["1", "20", "60", "100"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Row(
        children: [
          for (var i = 0; i < 4; i++)
            GestureDetector(
              onTap: () {
                widget.onSelected("${planted[i]}");
                setState(() {
                  _selected = i;
                });
              },
              child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: _selected == i
                      ? Theme.of(context).accentColor
                      : Color(0xFFDCDCDC),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                child: Text(
                  "${planted[i]}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: _selected == i ? Colors.white : Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class ListTileItem extends StatefulWidget {
  @override
  _ListTileItemState createState() => new _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  // int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      // title: new Text("widgettitle"),
      trailing: new Row(
        children: <Widget>[
          _itemCount != 0
              ? new IconButton(
                  icon: new Icon(Icons.remove),
                  onPressed: () => setState(() => _itemCount--),
                )
              : new Container(),
          new Text(_itemCount.toString()),
          new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () => setState(() => _itemCount++))
        ],
      ),
    );
  }
}
