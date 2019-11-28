import 'package:flutter/material.dart';
import 'package:sample_project/app_screen/diverlogin.dart';
import 'package:sample_project/app_screen/passenger_signup.dart';
import 'package:sample_project/app_screen/driver_signup.dart';
import 'package:sample_project/app_screen/login.dart';
import 'package:sample_project/app_screen/diverlogin.dart';


void main(){
  
    runApp(
      MaterialApp(
        theme:ThemeData(
          primarySwatch: Colors.pink),
      home:LoginInterface(),
      debugShowCheckedModeBanner: false,
    )
  );
}
