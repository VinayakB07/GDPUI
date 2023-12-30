import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/pages/admin.dart';
import 'package:food_app/pages/bottomnav.dart';
import 'package:food_app/pages/new_menu.dart';
import 'package:food_app/pages/trial.dart';
import 'package:get/get.dart';

import '../pages/onboard.dart';
import '../pages/welcome_screen.dart';
import 'exception/signup_email_authentication_failure.dart';


class AuthentiactionRepository extends GetxController{
  static AuthentiactionRepository get instance => Get.find();
  
  final _auth=FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser=Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user==null?Get.offAll(()=> OnboardingScreen()):Get.offAll(()=>BottomNav());
  }

  Future<void> cerateUserWithEmailAndPassword(String email,String password,String name)async{
    try{
      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      user?.updateDisplayName(name);
      user?.updateEmail(email);
    }on FirebaseAuthException catch(e){

    }catch(_){}

  }
  Future<void> loginWithEmailAndPassword(String email,String password)async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value == null ? Get.offAll(() => welcome()) : Get.offAll(() => BottomNav());
    }on FirebaseAuthException catch(e){
     final ex=SignUpWithEmailAndPasswordFailure.code(e.code);
     print('FIREBASE AUTH EXCEPTION - ${ex.message}');
     throw ex;
    }catch(_){
      final ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }

  }
  Future<void> logout()async=>await _auth.signOut();
}

