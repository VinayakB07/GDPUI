import 'package:flutter/material.dart';
import 'package:food_app/pages/admin.dart';
import 'package:food_app/pages/signup.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(


      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("images/food.png"))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height / 3),
                    height: height,
                    width: MediaQuery.of(context).size.width,
                    child: Text(''),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.19,
                          ),
                          Center(
                              child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(blurRadius: 1, spreadRadius: 1)
                            ]),
                            child: Image(
                              image: AssetImage(
                                'images/desipharata.png',
                              ),
                              height: height * 0.2,
                            ),
                          )),
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "No #1 Delicious Paratha in Bangalore",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                              Text(
                                "GRAND DESI PARATHA",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(children: <Widget>[
                            Expanded(
                                child: Divider(
                                  color: Colors.redAccent,
                                )),
                            SizedBox(width: 5,),
                            Text("Log-In "),
                            SizedBox(width: 5,),
                            Expanded(
                                child: Divider(
                                  color: Colors.redAccent,
                                )),
                          ]),
                          Container(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Form(
                              key: _formkey,
                              child: Column(
                                children: [

                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextFormField(
                                    controller: controller.email,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter E-mail";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 6),
                                      labelText: 'Email',
                                      prefixIcon: Icon(Icons.email_outlined),
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.redAccent),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextFormField(
                                    controller: controller.password,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter Password";
                                      }
                                      return null;
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 6),
                                      labelText: 'Password',
                                      prefixIcon: Icon(Icons.fingerprint_outlined),
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.redAccent),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                        onPressed: () {
                                          Get.offAll(ForgotPassword(),transition: Transition.zoom,duration: Duration(milliseconds: 600));
                                        },
                                        child: Text(
                                          "Forgot Password ?",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.redAccent,
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                      onPressed: () {
                                        if (_formkey.currentState!.validate()) {
                                          SignUpController.instance.loginUser(
                                              controller.email.text.trim(),
                                              controller.password.text.trim());
                                        }
                                      },
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          GestureDetector(
                              onTap: () {
                                Get.offAll(SignUp(),transition: Transition.zoom,duration: Duration(milliseconds: 600));
                                // Navigator.pushReplacement(
                                //   context,
                                //   PageRouteBuilder(
                                //     transitionDuration:
                                //         Duration(milliseconds: 1000),
                                //     // Set duration here
                                //     pageBuilder: (_, __, ___) => SignUp(),
                                //     transitionsBuilder:
                                //         (_, animation, __, child) {
                                //       return SlideTransition(
                                //         position: Tween<Offset>(
                                //           begin: Offset(1.0, 0.0),
                                //           end: Offset.zero,
                                //         ).animate(CurvedAnimation(
                                //           parent: animation,
                                //           curve: Curves
                                //               .linear, // Set your preferred curve here
                                //         )),
                                //         child: child,
                                //       );
                                //     },
                                //   ),
                                // );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don\'t have a account ? ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Sign-Up",
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
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
