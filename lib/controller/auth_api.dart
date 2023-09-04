import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/config.dart';

class AuthApi {
  static String loginUrl = AppConst.url + "/auth/login";
  static void loginUser(
      {required String email, required String password}) async {
    try {
    if (email.isNotEmpty && password.isNotEmpty) {
      var regBody = {"email": email, "password": password};

      var response = await http.post(
        Uri.parse(loginUrl),
        body: jsonEncode(regBody),
        headers: {"Content-Type": "application/json"},
      );
      print(response.body);
      print(".......................................");

      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['resultat']) {
        print('login is successful ya 7ama');
      } else {
        print('something went wrong ya 7ama');
      }
    }
    } catch (e) {
      print(e);
    }
  }
}
