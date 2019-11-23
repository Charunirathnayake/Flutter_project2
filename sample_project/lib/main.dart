import 'package:flutter/material.dart';
import 'package:sample_project/app_screen/passenger_signup.dart';
import 'package:sample_project/app_screen/driver_signup.dart';
import 'package:sample_project/app_screen/login.dart';


void main(){
  
    runApp(
      MaterialApp(
        theme:ThemeData(
          primarySwatch: Colors.blueGrey
      ),
      home: LoginInterface(),
      debugShowCheckedModeBanner: false,
    )
  );
}
