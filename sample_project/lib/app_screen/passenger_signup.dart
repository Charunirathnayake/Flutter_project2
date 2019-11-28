import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_project/app_screen/login.dart';
import 'usermanagement.dart';

//create appbar
class PassengerSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SignUp',
          style: TextStyle(fontSize: 25.0),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Register(),
    );
  }
}

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Register_state();
  }
}

class Register_state extends State<Register> {
  var _formKey = GlobalKey<FormState>();
  UserManagement userObj = new UserManagement();

//define the controllers
  TextEditingController firstcontroller = TextEditingController();
  TextEditingController secondcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

//password visibility icon changing
  bool _isHiddenPw = true;
  bool _isHiddenCPw = true;

  void _visiblePw() {
    setState(() {
      _isHiddenPw = !_isHiddenPw;
      _isHiddenCPw = _isHiddenCPw;
    });
  }

  void _visibleCPw() {
    setState(() {
      _isHiddenPw = _isHiddenPw;
      _isHiddenCPw = !_isHiddenCPw;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
            child: ListView(children: <Widget>[
          Text(
            'Your Signup will show up here.',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text('SignUp',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0)),
          SizedBox(
            height: 30.0,
          ),

//firstname textfield
          Center(
            child: Container(
              height: 40.0,
              width: 280.0,
              child: TextFormField(
                validator: (String value){
                  if(value.isEmpty){
                    return "Please type your name";
                  }
                  else {
                    return null;
                  }
                },
                controller: firstcontroller,
                decoration: InputDecoration(
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15.0),
                    labelText: 'First Name',
                    labelStyle: TextStyle(fontSize: 15.0, color: Colors.black),
                    hintText: 'Nipun',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),

// lastname field
          Center(
            child: Container(
              height: 40.0,
              width: 280.0,
              child: TextFormField(
                validator: (String value){
                  if(value.isEmpty){
                    return "Enter the name";
                  }
                  else {
                    return null;
                  }
                },
                controller: secondcontroller,
                decoration: InputDecoration(
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15.0),
                    hoverColor: Color(0xffBA680B),
                    labelText: 'Last Name',
                    labelStyle: TextStyle(fontSize: 15.0, color: Colors.black),
                    hintText: 'Sachintha',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
          ),

          SizedBox(
            height: 20.0,
          ),

          //e-mail field
          Center(
            child: Container(
              height: 40.0,
              width: 280.0,
              child: TextFormField(
                controller: mailcontroller,
                validator: validateEmail,
                decoration: InputDecoration(
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15.0),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(fontSize: 15.0, color: Colors.black),
                    hintText: 'nipunsachintha@gmail.com',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
          ),

          SizedBox(
            height: 20.0,
          ),

          //password field
          Center(
            child: Container(
              height: 40.0,
              width: 280.0,
              child: TextFormField(
                controller: passcontroller,
                obscureText: _isHiddenPw,
                decoration: InputDecoration(
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15.0),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: _visiblePw,
                      icon: _isHiddenPw
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(fontSize: 15.0, color: Colors.black),
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),

          SizedBox(
            height: 20.0,
          ),

          //sign up button
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: RaisedButton(
                color: Colors.pinkAccent,
                hoverColor: Color(0xffF5CA99),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: mailcontroller.text,
                        password: passcontroller.text);

                    userObj.addData({
                      'firstname': this.firstcontroller.text,
                      'lastname': this.secondcontroller.text,
                      'email': this.mailcontroller.text,
                    });
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  side: BorderSide(color: Color(0xff079CA3)),
                ),
                child: Text(
                  'SignUp',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                )),
          ),

          SizedBox(
            height: 20.0,
          ),

          Row(
            children: <Widget>[
              SizedBox(
                width: 25.0,
              ),
              Text('Already have a account?',
                  style: TextStyle(
                      decorationStyle: TextDecorationStyle.solid,
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                child: Text(
                  'Log here',
                  style: TextStyle(
                      decorationStyle: TextDecorationStyle.solid,
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginInterface(),
                      ));
                },
              ),
            ],
          ),

          SizedBox(
            height: 20.0,
            width: 25.0,
          ),

          Padding(
            child: Text(
                'When using යමං you accept our Terms & conitions and privacy policy.',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)),
            padding: EdgeInsets.only(right: 25.0, left: 25.0),
          ),

          SizedBox(
            height: 10.0,
          )
        ])));
  }
}

//validate email
String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Enter Valid Email';
  }
  return null;
}

