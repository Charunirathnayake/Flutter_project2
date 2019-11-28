import 'package:flutter/material.dart';
import 'package:sample_project/app_screen/diverlogin.dart';
import 'usermanagement_D.dart';
import 'package:firebase_auth/firebase_auth.dart';

//create appbar
class DriverSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body:Choosepage(),
      appBar: AppBar(
        title: Text(
          'SignUp',
          style: TextStyle(fontSize: 25.0, color: Colors.grey),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: RegisterDriver(),
    );
  }
}

class RegisterDriver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterDriver_state();
  }
}

class RegisterDriver_state extends State<RegisterDriver> {
  var _threewheeler_type = ['Bajaj', 'Piaggio'];
  var currentvalue = 'Bajaj';

  var _formKey = GlobalKey<FormState>();
  UserManagement_d userObj = new UserManagement_d();

  String uservalue;

  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController secondnamecontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

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
            controller: firstnamecontroller,
            decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15.0),
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
            controller: secondnamecontroller,
            decoration: InputDecoration(
                hoverColor: Color(0xffBA680B),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15.0),
                labelText: 'Last Name',
                labelStyle: TextStyle(fontSize: 15.0, color: Colors.black),
                hintText: 'Sachintha',
                hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
        ),
      ),

      SizedBox(height: 20.0),

      //select the three-wheeler type
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Container(
          height: 40.0,
          width: 280.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(width: 1.0, color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Three-Wheeler Type',
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                SizedBox(
                  width: 20.0,
                ),
                //dropdownbutton for select the type
                DropdownButton<String>(
                  items: _threewheeler_type.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String valueselected) {
                    //TODO:when user select the button what will happen
                    setState(() {
                      this.currentvalue = valueselected;
                      uservalue = currentvalue;
                    });
                  },
                  value: currentvalue,
                )
              ],
            ),
          ),
        ),
      ),

      SizedBox(
        height: 20.0,
      ),

      //E-mail
      Center(
        child: Container(
          height: 40.0,
          width: 280.0,
          child: TextFormField(
            controller: mailcontroller,
            validator: validateEmail,
            decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15.0),
                labelText: 'E-mail',
                labelStyle: TextStyle(fontSize: 15.0, color: Colors.black),
                hintText: 'nipun@gmail.com',
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
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: _visiblePw,
                  icon: _isHiddenPw
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15.0),
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
                    email: mailcontroller.text, password: passcontroller.text);

                userObj.addData({
                  'firstname': this.firstnamecontroller.text,
                  'lastname': this.secondnamecontroller.text,
                  'email': this.mailcontroller.text,
                  'wheeltype': this.uservalue,
                });
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
                side: BorderSide(
                  color: Colors.pinkAccent,
                )),
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
                    builder: (context) => Drlogin(),
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
