import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  loginWithModel(String login, String password) async {
    try {
      final url = Uri.parse("https://recruitment-api.pyt1.stg.jmr.pl/login");

      final response = await http.post(url, body: jsonEncode({
          "login": login,
          "password": password,
        }),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        LoginModel model = LoginModel.fromJson(jsonDecode(response.body));
        print("message ${model.message}");
        Fluttertoast.showToast(
          msg: "Login successful: ${model.message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else if (response.statusCode == 400) {
        Fluttertoast.showToast(
          msg: "Invalid credentials. Please try again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
