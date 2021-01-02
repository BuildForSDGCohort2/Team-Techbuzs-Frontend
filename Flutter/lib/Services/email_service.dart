import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dart_ipify/dart_ipify.dart';

class EmailService {
  Future<http.Response> sendtrans(String message, String email, String name) {
    return http.post(
      'https://sdgfortb.herokuapp.com/emailtrans',
      body: jsonEncode(
          <String, dynamic>{"email": email, "name": name, "message": message}),
    );
  }
}

getip() async {
  final ipv4 = await Ipify.ipv4();
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


