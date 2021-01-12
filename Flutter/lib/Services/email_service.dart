import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:dart_ipify/dart_ipify.dart'; // Later

class EmailService {
  Future<http.Response> sendtrans(String metadata, String email, String name,
      String treeamount, String treepacks, String amount, String type) {
    Map map = {
      "type": type,
      "tree_amount": treeamount,
      "tree_packs": treepacks,
      "amount": amount,
      "email": email,
      "name": name,
      "message": metadata
    };
    var body = json.encode(map);

    return http.post('https://sdgfortb.herokuapp.com/emailtrans', body: body);
  }
}

getip() async {
  // final ipv4 = await Ipify.ipv4();
}

class GetLocationIp {
  Future getlocation(String ip) async {
    var url =
        "https://geo.ipify.org/api/v1?apiKey=at_AArpcypFpqAOoDaB0rSvlKILdf2se&ipAddress=$ip";
    var response = await http.get(url);
    return response.body;
  }
  // Future<http.Response> getlocation(String ip) {
  //   return http.get(
  //       "https://geo.ipify.org/api/v1?apiKey=at_AArpcypFpqAOoDaB0rSvlKILdf2se&ipAddress=$ip");
  // }
}
