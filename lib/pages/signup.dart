import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/sign_up_controller.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

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
                    height: height / 3.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage("images/food1.png"),
                      ),
                    ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.16),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [BoxShadow(blurRadius: 1, spreadRadius: 1)],
                              ),
                              child: Image(
                                image: AssetImage('images/desipharata.png'),
                                height: height * 0.2,
                              ),
                            ),
                          ),

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
                          Row(
                            children: <Widget>[
                              Expanded(child: Divider(color: Colors.redAccent)),
                              SizedBox(width: 5),
                              Text("Sign-Up"),
                              SizedBox(width: 5),
                              Expanded(child: Divider(color: Colors.redAccent)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: controller.fullname,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter name";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 6),
                                      labelText: 'Name',
                                      prefixIcon: Icon(Icons.person_outline_rounded),
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.redAccent),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
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
                                  SizedBox(height: 10),
                                  TextFormField(
                                    controller: controller.phone,
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.trim().length != 10) {
                                        return "Please enter a valid number";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 6),
                                      labelText: 'Phone No',
                                      prefixIcon: Icon(Icons.phone_android),
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.redAccent),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
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
                                  SizedBox(height: 10),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          SignUpController.instance.registerUser(
                                            controller.email.text.trim(),
                                            controller.password.text.trim(),
                                            controller.fullname.text,
                                            controller.phone.text.trim(),
                                          );
                                        }
                                      },
                                      child: Text(
                                        "SIGN UP",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(LogIn(),transition: Transition.zoom,duration: Duration(milliseconds: 600));
                              // ... (other navigation)
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  " Login",
                                  style: TextStyle(color: Colors.redAccent, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
