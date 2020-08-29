import 'package:flutter/material.dart';
import 'package:http/http' as http;
class EmailService{
Future<http.Response> sendtrans(String message, String email, String name) {
    return http.post(
      'https://sdgfortb.herokuapp.com/emailtrans',
      body: jsonEncode(<String, dynamic>{
     			"email": email,
                "name" :name,
                "message":message


      }),
    );
  }
}

	

