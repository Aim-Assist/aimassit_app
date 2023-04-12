
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginsys/src/features/authentication/exceptions/SignUpWithEmailAndPasswordFailure.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/dashboard.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/Signup/widgets/signup_form_widget.dart';
import 'package:loginsys/src/constants/colors.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/sizes.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/welcome.dart';
import 'package:get/get.dart';

import 'exceptions/LogInWithEmailAndPasswordFailure.dart';


class AuthenticationRepository extends GetxController {

    static AuthenticationRepository get instance => Get.find();

    final _auth = FirebaseAuth.instance;
    late final Rx<User?> firebaseUser;

    @override
    void onReady(){
      firebaseUser = Rx<User?>(_auth.currentUser);
      firebaseUser.bindStream(_auth.userChanges());
      ever(firebaseUser, _setInitialScreen);
    }

    _setInitialScreen(User? user){
      user == null ? Get.offAll(()=> const WelcomeScreen()) : Get.offAll(()=> const Dashboard());
    }
  
  Future<void> createUserWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null? Get.offAll(()=> const Dashboard()): Get.to(()=> const WelcomeScreen());

    }on FirebaseAuthException catch(e){
      final ex =  SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;

    }catch(_){
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  //  
  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.fromCode(e.code);
      return ex.message;
    } catch (_) {
      const ex = LogInWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }


    Future<void> logout() async => await _auth.signOut();



  
  }
