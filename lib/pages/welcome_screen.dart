import 'package:flutter/material.dart';
import 'package:food_app/pages/login.dart';
import 'package:food_app/pages/signup.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/animation_design.dart';
import '../controller/fade_in_animation_controller.dart';
import '../controller/fade_in_animation_model.dart';

class welcome extends StatelessWidget {
  welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            TFadeInAnimation(
              durationInMs: 1500,
              animatePosition: TAnimatePosition(
                  bottomAfter: 0,
                  bottomBefore:-100,
                  leftBefore: 0,
                  leftAfter: 0,
                  rightAfter: 0,
                  rightBefore: 0,
                  topBefore: 0,
                  topAfter: 0),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: NetworkImage(
                            "https://img.freepik.com/premium-photo/table-full-food-including-rice-curry-plate-food_900958-7307.jpg?w=1380"))),
                padding: EdgeInsets.all(0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 140,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(blurRadius: 1, spreadRadius: 1)],
                      ),
                      child: Image(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQL2HOpHygUvXKuKBdATpW9rDES0d5_xzRVA&usqp=CAU"),
                        height: height * 0.2,
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
                    SizedBox(height: 10),
                    Row(children: <Widget>[
                      Expanded(
                          child: Divider(
                        color: Colors.deepOrange,
                      )),
                      SizedBox(width: 5,),
                      Text("Log in or Sign up"),
                      SizedBox(width: 5,),
                      Expanded(
                          child: Divider(
                        color: Colors.deepOrange,
                      )),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              side: BorderSide(
                                  width: 1.5, color: Colors.deepOrange)),
                          onPressed: () => Get.to(() => const LogIn()),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () => Get.to(() => const SignUp()),
                          child: Text(
                            "SIGN-UP",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Always at your Service to feed you!",
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(
                          Icons.food_bank_outlined,
                          color: Colors.deepOrange,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
