import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';

class SignInshar extends StatefulWidget {
  @override
  _SignInsharState createState() => _SignInsharState();
}

class _SignInsharState extends State<SignInshar> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email, password ;
  bool  _remeberpassword = false;

  void _signIn({String em, String pw}) async{
    final newUser = await  _auth.createUserWithEmailAndPassword(email: em, password: pw);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Container(
        color: Colors.yellow,
        child: Text('Welcome '),
      );
    }));

  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
          Text("Sign In",style: TextStyle(
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.w600,
          ),
          ),
          SizedBox(
            height:  12.0,
          ),
          TextField(
        onChanged: (textVal){
      setState(() {
        email = textVal;
      }); },
            decoration:InputDecoration(
                hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.6)
                ),
                hintText: "Enter Email",focusColor: Colors.white,
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
                  color: Colors.white,
                ))),
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ) ,
          ),
          SizedBox(
            height:  12.0,
          ),
          TextField(
            onChanged: (textVal){
              setState(() {
                password = textVal;
              }); },
            obscureText: true,
            decoration:InputDecoration(
                hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.6)
                ),
                hintText: "Enter Password",focusColor: Colors.white,
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
                  color: Colors.white,
                ))),
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ) ,
          ),
          SizedBox(
            height:  12.0,
          ),

          Row(
            children: [
              Checkbox(
                  activeColor: Colors.red,
                  value: _remeberpassword, onChanged: (newvalue){
                setState(() {
                  _remeberpassword = newvalue;
                });

              }),
              SizedBox(
                height:  12.0,
              ),
              Text("Remember Password", style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              )

              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              SizedBox(
                height:  12.0,
              ),
              InkWell(onTap: (){
                _signIn(em: email,pw: password);

              },

                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 34.0),
                  decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60.0)
                  ),
                  child: Text("LOG IN",style: TextStyle(color: Colors.red,
                      fontSize: 20.0,fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
          SizedBox(
            height:  12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [Container(
              child: SignInButton.mini(
                buttonType: ButtonType.google,
                onPressed: () {},
              ),
            ),
              SizedBox(
                width:  12.0,
              ),
              SignInButton.mini(
                buttonType: ButtonType.facebook,
                onPressed: () {},
              ),

            ]
          ),
          SizedBox(
            height:  15.0,
          ),
          Text(
            'Forgot password',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
        ],
      ),




    );
  }
}
