import 'package:flutter/material.dart';
import 'auth.dart';

//sketch of the login page
class LoginInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Loginpage(),
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(fontSize: 20.0),
        ),
        backgroundColor: Color(0xff079CA3),
      ),
    );
  }
}

class Loginpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Loginpage_state();
  }
}

class Loginpage_state extends State<Loginpage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  var _formKey = GlobalKey<FormState>();


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
    return Container(
        child: Form(
      key: _formKey,
      child: ListView(children: <Widget>[
        Text(
          'Join with යමං',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text('Login',
            style: TextStyle(
                color: Color(0xffBA680B),
                fontWeight: FontWeight.bold,
                fontSize: 25.0)),
        SizedBox(
          height: 30.0,
        ),

        //Enter E-mail
        Center(
          child: Container(
            height: 40.0,
            width: 280.0,
            child: TextFormField(
              validator:  (String value) {
                    if (value.isEmpty) {
                      return "Enter the E-mail Address";
                    }
                    return null;
                  },
              controller: emailcontroller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'E-mail',
                  hintText: 'nikeshi@gmail.com',
                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),

        //Enter password
        Center(
          child: Container(
            height: 40.0,
            width: 280.0,
            child: TextFormField(
              validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter the Password";
                    }
                    return null;
                  }, 
              controller: passwordcontroller,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed:  _visiblePw,
                      icon: _isHiddenPw
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                  labelText: 'Password',
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),

        //Navigate Signup
        Center(
          child: Container(
            child: GestureDetector(
              child: Text(
                'No Account yet?SignUp here',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                    fontSize: 15.0,
                    color: Color(0xff7B4508),
                    fontWeight: FontWeight.bold,
                    decorationThickness: 1.5),
              ),
              onTap: () {
                //TODO:define ontap
              },
            ),
          ),
        ),

        SizedBox(
          height: 10.0,
        ),

        //button for login
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: RaisedButton(
              color: Color(0xffBA680B),
              hoverColor: Color(0xffF5CA99),
              onPressed: () async {
                if (emailcontroller.text.isEmpty ||
                    passwordcontroller.text.isEmpty) {
                        setState(() {
                          _formKey.currentState.reset();
                        });

                  return;
                } else {
                  bool res = await Connection().signInWithEmail(
                      emailcontroller.text, passwordcontroller.text);
                  if (res == true) {
                    print("hello");
                  }
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
                side: BorderSide(color: Color(0xffBA680B)),
              ),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              )),
        ),

        //Forget password
        Center(
          child: Container(
            child: GestureDetector(
              child: Text(
                'I forget my password',
                style: TextStyle(
                    decorationStyle: TextDecorationStyle.solid,
                    fontSize: 15.0,
                    color: Color(0xff7B4508),
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                //TODO:DEFINE ONTAP
              },
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        )
      ]),
    ));
  }
}
