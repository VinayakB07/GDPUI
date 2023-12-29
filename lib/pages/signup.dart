
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/support_widget.dart';
import 'bottomnav.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email="";
  String password="";
  String name="";
  TextEditingController  Emialcontorller= new TextEditingController();
  TextEditingController  Namecontorller= new TextEditingController();
  TextEditingController  Passwordcontorller= new TextEditingController();
  final _formkey=GlobalKey<FormState>();
  registration()async{
    if(password!=null){
      try{
        UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration Successful",style: TextStyle(
          fontSize: 20,
        ),)));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav()));
      }on FirebaseAuthException catch(e){
        if(e.code=="weak-password"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Provided is too weak",style: TextStyle(
            fontSize: 20,
          ),)));
        }
        else if(e.code=="email-already-in-use"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account already exist",style: TextStyle(
            fontSize: 20,
          ),)));
        }

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage("https://img.freepik.com/premium-photo/table-full-food-including-rice-curry-plate-food_900958-7307.jpg?w=1380"))
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,

                    child: Text(''),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Column(
                        children: [
                          SizedBox(height: 160,),
                          Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(blurRadius: 1)]
                                ),
                                child: Image(
                                  image: AssetImage('images/desipharata.png',),
                                  height: 120,
                                ),
                              )),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Form(
                              key: _formkey,
                              child: Column(
                                children: [

                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextFormField(
                                      controller: Namecontorller,
                                      validator: (value){
                                        if(value==null||value.isEmpty){
                                          return "please enter name";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide:BorderSide(color: Colors.deepOrangeAccent)),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                        label: Text(
                                          'Name',
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        prefixIcon: Icon(Icons.person),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextFormField(
                                      controller: Emialcontorller,
                                      validator: (value){
                                        if(value==null||value.isEmpty){
                                          return "please enter E-mail";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide:BorderSide(color: Colors.deepOrangeAccent)),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
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
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextFormField(

                                      controller: Passwordcontorller,
                                      validator: (value){
                                        if(value==null||value.isEmpty){
                                          return "please enter Password";
                                        }
                                        return null;
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                            borderSide:BorderSide(color: Colors.deepOrangeAccent)),
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
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: ()async{
                                      if(_formkey.currentState!.validate()){
                                        setState(() {
                                          email=Emialcontorller.text;
                                          name=Namecontorller.text;
                                          password=Passwordcontorller.text;
                                        });
                                      }
                                      registration();
                                    },
                                    child: Material(
                                      elevation: 5.0,
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xffff5722),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Sign UP',
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
                            height: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogIn()));
                              },
                              child: Text(
                                "Already have have a account ?Login",
                                style:TextStyle(
                                  fontSize:18,
                                  fontWeight: FontWeight.bold
                                ),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}