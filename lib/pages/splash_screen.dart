import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controller/animation_design.dart';
import '../controller/fade_in_animation_controller.dart';
import '../controller/fade_in_animation_model.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});



  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    final controller=Get.put(FadeInAnimationController());
    controller.startSplashAnimation();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            TFadeInAnimation(
              durationInMs: 2000, animatePosition: TAnimatePosition(
                bottomAfter: height/2.25,bottomBefore: height/3,leftAfter:(MediaQuery.of(context).size.width/2)-(height*0.25/2),leftBefore: (MediaQuery.of(context).size.width/2)-(height*0.25/2)
            ),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 1, spreadRadius: 1)],
                  ),
                  child:Image(image:AssetImage("images/desipharata.png"),height: height*0.25,)),

            ),


          ],
        ),
      ),
    );
  }


}

