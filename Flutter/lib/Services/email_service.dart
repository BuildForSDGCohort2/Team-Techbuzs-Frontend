import 'dart:convert';

import 'package:http/http.dart' as http;

class EmailService {
  Future<http.Response> sendtrans(
      String message, String email, String name) async {
    return http.post(
      'https://sdgfortb.herokuapp.com/emailtrans',
      body: jsonEncode(
          <String, dynamic>{"email": email, "name": name, "message": message}),
    );
  }

  sendEmail(String message, String email, String name) async {
    var url = 'https://sdgfortb.herokuapp.com/emailtrans';
    var response = await http.post(url,
        body: jsonEncode({
          "auth": "admin101\$",
          "email": email,
          "name": name,
          "message": message
        }),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 202) {
      print('Success ${response.body}');
    } else {
      print('error ${response.body}');
    }
  }
}
