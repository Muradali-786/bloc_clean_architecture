import 'dart:async';

import 'package:bloc_clean_architecture/config/routes/route_name.dart';
import 'package:flutter/material.dart';

class SplashServices{




  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 2), (){
      Navigator.pushNamedAndRemoveUntil(context, RouteName.login,(route)=>false);
    });
  }
}