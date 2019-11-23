import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'usermanagement.dart';
//create appbar
class PassengerSignup extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      //body:Choosepage(),
      appBar: AppBar(
        title: Text(
          'SignUp',
          style: TextStyle(fontSize: 25.0),
        ),
        backgroundColor: Color(0xff079CA3),
      ),
      body: Register(),
    );
  }
}

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return Register_state();
  }
}

class Register_state extends State<Register>{

  var _formKey = GlobalKey<FormState>();
   UserManagement userObj=new UserManagement();

   

  TextEditingController firstcontroller=TextEditingController();
  TextEditingController secondcontroller=TextEditingController();
  TextEditingController mailcontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:
    Container(
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
                color: Color(0xff079CA3),
                fontWeight: FontWeight.bold,
                fontSize: 25.0)),
        SizedBox(
          height: 30.0,
        ),

        
        
        
        
//firstname textfield
         Center(child: Container(
          height:40.0 ,
          width:280.0 ,
        child: TextFormField(
          controller: firstcontroller,
          decoration: InputDecoration(
              labelText: 'First Name',
              labelStyle: TextStyle(fontSize: 15.0,color: Colors.black),
              hintText: 'Nipun',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
              border: OutlineInputBorder(
              borderSide: BorderSide( 
                color: Colors.grey
              )

              )
              ),
        )
        ,)
         ,),
         SizedBox(
           height: 20.0,
         ),
// lastname field
         Center(child: Container(
          height:40.0 ,
          width:280.0 ,
        child: TextFormField(
          controller: secondcontroller,
           decoration: InputDecoration(
            hoverColor: Color(0xffBA680B),
              labelText: 'Last Name',
              labelStyle: TextStyle(fontSize: 15.0,color: Colors.black),
              hintText: 'Sachintha',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
              border: OutlineInputBorder(
              borderSide: BorderSide( 
                color: Colors.grey
              )

              )
              ),
        )
        ,)
         ,),

         SizedBox(
           height: 20.0,
         ),

         //e-mail field
         Center(child: Container(
          height:40.0 ,
          width:280.0 ,
        child: TextFormField(
          controller: mailcontroller,
          decoration: InputDecoration(
              labelText: 'E-mail',
              labelStyle: TextStyle(fontSize: 15.0,color: Colors.black),
              hintText: 'nipunsachintha@gmail.com',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
              border: OutlineInputBorder(
              borderSide: BorderSide( 
                color: Colors.grey
              )

              )
              ),
        )
        ,)
         ,),

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
         obscureText: true,
          decoration: InputDecoration(
              prefixIcon:
                 Icon(Icons.lock),
              suffixIcon:
                  IconButton(
                      onPressed: () {
                        //todolist
                      },
                      icon: Icon(Icons.visibility_off),
                    ),
              labelText: 'Password',
              labelStyle: TextStyle(fontSize: 15.0,color: Colors.black),
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
              border: OutlineInputBorder(
               borderSide: BorderSide( 
                color: Colors.grey
              ) 
              )
              ),
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    ),

     SizedBox(
           height: 20.0,
         ),

    //sign up button
      Padding(
          padding: EdgeInsets.only(left: 20.0,right: 20.0),
          child: RaisedButton(
            color: Color(0xff079CA3),
            hoverColor: Color(0xffF5CA99),
            onPressed: () async{
                if(_formKey.currentState.validate()){
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: mailcontroller.text,
                          password: passcontroller.text
                        );
//TODO:navigation for login page
                  userObj.addData({
                          'firstname':this.firstcontroller.text,
                          'lastname':this.secondcontroller.text,
                          'email':this.mailcontroller.text,
                        });

                }
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
              side: BorderSide(color: Color(0xff079CA3)),
            ),
            child: Text('SignUp',style:TextStyle(color: Colors.white,fontSize: 20.0),)
          ),
        ),

        SizedBox(
          height: 20.0,
        ),


        Row(children: <Widget>[
          SizedBox(
            width: 25.0,
          ),
            Text('Already have a account?',style:TextStyle(
          decorationStyle: TextDecorationStyle.solid, fontSize: 15.0,
                    color: Color(0xff079CA3),
                    fontWeight: FontWeight.bold  )
                    ),

             SizedBox(width: 10.0,),

            GestureDetector(
              child: Text(
                'Log here',
                style: TextStyle(
                    decorationStyle: TextDecorationStyle.solid, fontSize: 15.0,
                    color: Color(0xff079CA3),
                    fontWeight: FontWeight.bold
                    ),
              ),
              onTap: () {
                //TODO:DEFINE ONTAP
              },
            ),


        ],
        ),

        SizedBox(
          height: 20.0,
          width: 25.0,
        ),

        Padding(child:Text('When using යමං you accept our Terms & conitions and privacy policy.',style:TextStyle(color: Colors.black,
        fontWeight:FontWeight.bold,fontSize:15.0
        )
        ),
        padding: EdgeInsets.only(right: 25.0,left: 25.0),
        ),
        
        SizedBox(height: 10.0,)

        ]
        )
        )
     ) ;
  }
}

