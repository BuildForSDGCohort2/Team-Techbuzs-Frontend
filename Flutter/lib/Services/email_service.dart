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
}
