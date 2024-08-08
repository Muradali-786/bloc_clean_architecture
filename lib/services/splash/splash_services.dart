import 'dart:async';

import 'package:bloc_clean_architecture/config/routes/route_name.dart';
import 'package:bloc_clean_architecture/services/session/session_manager.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionManager().getUserFromPreference().then((value) {
      if (SessionManager.isLogin ?? false) {
        Timer(const Duration(seconds: 2), () {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.homePage, (route) => false);
        });
      } else {
        Timer(const Duration(seconds: 2), () {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.login, (route) => false);
        });
      }
    }).onError((error, stackTrace) {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.login, (route) => false);
      });
    });
  }
}
