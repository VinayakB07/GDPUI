
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/signup.dart';


import '../widget/support_widget.dart';

import 'forgotpassword.dart';


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email="",password="";
  TextEditingController useremailcontroller=new TextEditingController();
  TextEditingController userpasswordcontroller=new TextEditingController();
  final _formkey=GlobalKey<FormState>();
  userLogin()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch(e){
      if(e.code=="user-not-found"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No user found for this email',style: TextStyle(
            fontSize: 20
        ),)));
      }else if(e.code=="wrong-password"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('wrong password provided',style: TextStyle(
            fontSize: 20
        ),)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFff5c30),
                      Color(0xFFe74b1a),
                    ],
                  ),
                ),
              ),
              Container(
                margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Text(''),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    children: [
                      Center(
                          child: Image(
                            image: AssetImage('images/desipharata.png'),
                          )),
                      Container(
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              Text(
                                'Login',
                                style: AppWidget.HeadLineTextFieldStyle(),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                controller: useremailcontroller,
                                validator: (value){
                                  if(value==null||value.isEmpty){
                                    return "please enter email";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text(
                                    'Email',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.mail),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                controller: userpasswordcontroller,
                                validator: (value){
                                  if(value==null||value.isEmpty){
                                    return "please enter password";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  label: Text(
                                    'Password',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.password_outlined),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40,),
                              GestureDetector(
                                onTap: (){
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      email=useremailcontroller.text;
                                      password=userpasswordcontroller.text;
                                    });
                                  }
                                  userLogin();
                                },
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20),

                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8.0),
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Color(0xffff5722 ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
                          },
                          child: Text("Don't have a account ? Sign Up",style: AppWidget.HeadLineTextFieldStyle(),))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}