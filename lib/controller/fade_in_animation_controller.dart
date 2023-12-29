import 'package:get/get.dart';





class FadeInAnimationController extends GetxController{
  static FadeInAnimationController get find=>Get.find();

  RxBool animate=false.obs;


  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value=true;
  }
}