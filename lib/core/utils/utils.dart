import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_internship_blog_app/screens/auth/register/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/bottom_nav/bottom_navbar.dart';

class Utils {
  Future<void> manupulationLogin(context) async {
    String token = await getToken();
    if (token.isNotEmpty) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
          return BottomNavBar();
        }),
        (route) => false,
      );
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
          return const RegisterScreen();
        }),
        (route) => false,
      );
    }
  }

  //save token
  static Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    const keyToken = 'token';
    await prefs.setString(keyToken, token);
  }

  //save id
  static Future<void> saveId(String userID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    const keyUserID = 'userId';
    await prefs.setString(keyUserID, userID);
  }

//get token
  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  // get userid
  Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId') ?? '';
  }

  // delete token
  Future<bool> logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove('token');
  }
}
