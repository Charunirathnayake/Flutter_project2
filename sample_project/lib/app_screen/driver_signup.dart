import 'package:flutter/material.dart';

//create appbar
class DriverSignup extends StatelessWidget{
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
      body: RegisterDriver(),
    );
  }
}

class RegisterDriver extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return RegisterDriver_state();
  }
}

class RegisterDriver_state extends State<RegisterDriver>{

  var _threewheeler_type=['Bajaj','Piaggio'];
  var currentvalue='Bajaj';

  @override
  Widget build(BuildContext context) {
    return Form(
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
           height: 20.0
         ),

         //select the three-wheeler type
        Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20.0),
          child: Container(
            height:40.0 ,
            width:280.0 ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey
                )
              ),
                child: Padding(
                  padding: const EdgeInsets.only(left:18.0),
                  child: Row(
                    children: <Widget>[
                      Text('Three-Wheeler Type',style: TextStyle(fontSize: 15.0,color: Colors.black),),
                          SizedBox(
                            width: 20.0,
                          ),
                      //dropdownbutton for select the type
                      DropdownButton<String>(
                          items: _threewheeler_type.map((String dropDownStringItem){
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),

                          onChanged: (String valueselected){
                            //TODO:when user select the button what will happen
                            setState(() {
                              this.currentvalue=valueselected;
                            });
                          },
                          value: currentvalue,
                      )
                    ],
                  ),
                ),
              ),
        ),
          
SizedBox(height: 20.0,),

         //phone number
         Center(child: Container(
          height:40.0 ,
          width:280.0 ,
        child: TextFormField(
          decoration: InputDecoration(
              labelText: 'Phone Number',
              labelStyle: TextStyle(fontSize: 15.0,color: Colors.black),
              hintText: '0xx2545335',
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
            onPressed: () {},
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

