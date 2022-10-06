import 'dart:async';
import 'dart:convert';

import 'package:cilekhavuz/api/api.dart';
import 'package:cilekhavuz/models/AuthModel.dart';
import 'package:cilekhavuz/utils/constants.dart';
import 'package:cilekhavuz/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BASE {
  static Future login(String userName, String password, context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    final prefs = await SharedPreferences.getInstance();

    AuthModel user = await API.login(userName, password);
    if (user.success == true) {
      String driveToken = await API.getDriveToken();
      prefs.setString("driveToken", driveToken);
      prefs.setString("user", json.encode(user));
      Navigator.pushNamedAndRemoveUntil(context, Routes.DASHBOARD, (route) => false);
    } else {
      Navigator.pop(context);
      Utils.showDefaultSnackbar(context, user.message!.replaceAll("->", ""), const Icon(LineIcons.infoCircle, color: Colors.blue));
    }
  }

  static Future<AuthModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("user");
    AuthModel? user;
    if (data != null) {
      try {
        user = AuthModel.fromJson(json.decode(data));
      } catch (ex) {
        return null;
      }
      if (user.success == true) {
        return user;
      } else {
        return null;
      }
    }
    return null;
  }

  static Future<String?> getDriveToken() async {
    final prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("driveToken");
    return data;
  }
}
