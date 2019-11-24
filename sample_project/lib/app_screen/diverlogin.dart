import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth.dart';

class Drlogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In', style: TextStyle(fontSize: 25.0)),
        backgroundColor: Color(0xff079CA3),
      ),
      body: Driverlogin(),
    );
  }
}

class Driverlogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Driverlogin_State();
  }
}

class Driverlogin_State extends State<Driverlogin> {
  String phonenumber;
  String smscode;
  String verficationcode;

  Future<void> phonelog() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      codeAutoRetrievalTimeout: autoRetrive,
      phoneNumber: this.phonenumber,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Sign In with Your Phone Number',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 40.0,
                    width: 280.0,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hoverColor: Color(0xffBA680B),
                          labelText: 'Phone Number',
                          labelStyle:
                              TextStyle(fontSize: 15.0, color: Colors.black),
                          hintText: '0**1234567',
                          hintStyle:
                              TextStyle(fontSize: 15.0, color: Colors.grey),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                ),

                SizedBox(
                  height: 50.0,
                ),

//login
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: ButtonTheme(
                    height: 30.0,
                    minWidth: 180.0,
                    child: RaisedButton(
                        color: Color(0xff079CA3),
                        hoverColor: Color(0xffF5CA99),
                        onPressed: phonelog(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side: BorderSide(color: Color(0xff079CA3)),
                        ),
                        child: Text(
                          'LogIn',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
