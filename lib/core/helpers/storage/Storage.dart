import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage{

  // static Future<void> saveUserData(UserModel model) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("user", json.encode(model.toJson()));
  // }
  //
  // static UserModel getSavedUser({required BuildContext context}) {
  //   return context.read<UserCubit>().state.model;
  // }

  static Future<String?> getDeviceId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("deviceId");
  }

  static Future<void> setDeviceId(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deviceId", token);
  }

  static Future<String?> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lang");
  }

  static Future<void> setLang(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", lang);
  }

  static void clearSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static void clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
  }

  // static int getCurrentUserId({required BuildContext context}) {
  //   var provider = context.watch<UserCubit>().state.model;
  //   return provider.data?.id??0;
  // }

  static Future<String?> getBaseUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("baseUrl");
  }

  static Future<void> setBaseUrl(String baseUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("baseUrl", baseUrl);
  }

}