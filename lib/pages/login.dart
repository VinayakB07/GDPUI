

import 'package:flutter/material.dart';
import 'package:food_app/pages/admin.dart';
import 'package:food_app/pages/signup.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/sign_up_controller.dart';
import '../widget/support_widget.dart';
import 'forgotpassword.dart';



class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final controller = Get.put(SignUpController());
  final _formkey=GlobalKey<FormState>();


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
                          SizedBox(height: 150,),
                          Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(blurRadius: 1)]
                                ),
                                child: Image(
                                  image: AssetImage('images/desipharata.png',),
                                  height: 130,
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
                                    height: 20.0,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextFormField(
                                      controller: controller.email,
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
                                        prefixIcon: Icon(Icons.email_outlined),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextFormField(

                                      controller: controller.password,
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
                                        prefixIcon: Icon(Icons.fingerprint_outlined),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      if(controller.email.text=="admin@gmail.com"&&controller.password.text=="123123"){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminOrdersScreen()));
                                      }
                                      else{
                                        SignUpController.instance.loginUser(
                                            controller.email.text.trim(),
                                            controller.password.text.trim());
                                      }
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
                            height: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don\'t have a account ? ",
                                    style:TextStyle(
                                        fontSize:18,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    "Sign-Up",
                                    style:TextStyle(
                                      color: Colors.deepOrange,
                                        fontSize:18,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
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