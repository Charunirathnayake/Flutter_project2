import 'package:flutter/material.dart';
import 'package:sample_project/app_screen/passenger_signup.dart';


void main(){
  
    runApp(
      MaterialApp(
        theme:ThemeData(
          primarySwatch: Colors.blueGrey
      ),
      home: PassengerSignup(),
      debugShowCheckedModeBanner: false,
    )
  );
}
