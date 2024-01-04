import 'package:food_app/pages/onboard.dart';
import 'package:get/get.dart';







class FadeInAnimationController extends GetxController{
  static FadeInAnimationController get find=>Get.find();

  RxBool animate=false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value=true;
    await Future.delayed(Duration(milliseconds: 3000));
    animate.value=false;
    await Future.delayed(Duration(milliseconds: 2000));
    Get.offAll(OnboardingScreen(),transition: Transition.fadeIn,duration: Duration(milliseconds: 1200));

  }
  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value=true;
  }
}