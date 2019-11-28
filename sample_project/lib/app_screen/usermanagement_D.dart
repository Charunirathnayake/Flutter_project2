import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManagement_d{
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }


  Future<void> addData(driverData) async{
    if(isLoggedIn()){
      Firestore.instance.collection('driver').add(driverData).catchError((e){
        print(e);
      });
    }else{
      print('You Need to log in');
    }
  }
}