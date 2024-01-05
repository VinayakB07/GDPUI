import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/pages/admin.dart';
import 'package:food_app/pages/bottomnav.dart';
import 'package:food_app/pages/login.dart';
import 'package:food_app/pages/menuselection.dart';
import 'package:get/get.dart';
import 'exception/signup_email_authentication_failure.dart';


class AuthentiactionRepository extends GetxController{
  static AuthentiactionRepository get instance => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth=FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser=Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      // Check if the user's email matches the admin email
      bool isAdmin = isAdminEmail(user.email!);

      if (isAdmin) {
        // Redirect to the admin page
        Get.offAll(()=> AdminOrdersScreen(),transition: Transition.zoom,duration: Duration(milliseconds: 600));
      } else {
        // Regular user, redirect to the appropriate page
        Get.offAll(()=> BottomNav());
      }
    } else {
      // Handle null user scenario
      Get.offAll(()=> MenuHome());

    }
  }


  Future<void> cerateUserWithEmailAndPassword(String email,String password,String name,String phone)async{
    try{

      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      user?.updateDisplayName(name);
      user?.updateEmail(email);
      if (user != null) {
        await _firestore.collection('UserDetail').doc(user.uid).set({
          'fullName': name,
          'email': email,
          'phoneNumber': phone,
          'location':"Not Set"
        });
      }
    }on FirebaseAuthException catch(e){

    }catch(_){}

  }
  bool isAdminEmail(String email) {
    // Replace with your admin email(s) or domain(s) check
    // For example, if admin email is admin@example.com:
    return email.toLowerCase() == 'admin@gmail.com';
  }
  Future<void> loginWithEmailAndPassword(String email,String password)async{
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // Get the current user
      User? firebaseUser = _auth.currentUser;

      if (firebaseUser != null) {
        // Check if the user's email matches the admin email
        bool isAdmin = isAdminEmail(firebaseUser.email!);

        if (isAdmin) {
          // Redirect to the admin page
          Get.offAll(()=> AdminOrdersScreen(),transition: Transition.zoom,duration: Duration(milliseconds: 600));
        } else {
          // Regular user, redirect to the appropriate page
          Get.offAll(()=> BottomNav());
        }
      } else {
        // Handle null user scenario
        Get.offAll(()=> LogIn(),transition: Transition.zoom,duration: Duration(milliseconds: 600));
      }
    } on FirebaseAuthException catch(e){
     final ex=SignUpWithEmailAndPasswordFailure.code(e.code);
     print('FIREBASE AUTH EXCEPTION - ${ex.message}');
     throw ex;
    }catch(_){
      final ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }

  }
  Future<void> logout()async{
    await _auth.signOut();
  }


}



