import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController{
static SignUpController get instance =>Get.find();

final email=TextEditingController();
final password=TextEditingController();
final fullname=TextEditingController();
final phone=TextEditingController();

void registerUser(String email,String password,String name,String phone){
AuthentiactionRepository.instance.cerateUserWithEmailAndPassword(email, password,name,phone);
}
void loginUser(String email,String password){
  AuthentiactionRepository.instance. loginWithEmailAndPassword(email, password);
}

}