import 'package:flutter/foundation.dart';

class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message ="An error has occured"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){

      case 'weak-password':
      return const SignUpWithEmailAndPasswordFailure('Plesase enter a stronger password');

      case 'invalid-email':
      return const SignUpWithEmailAndPasswordFailure('Email is not valid or badly formed');

      case 'email-already-in-use':
      return const SignUpWithEmailAndPasswordFailure('An account already exists for the same email id');

      case 'operation-not-allowed':
      return const SignUpWithEmailAndPasswordFailure('Operation is not valid. please try again');

      case 'user-disabled':
      return const SignUpWithEmailAndPasswordFailure('User is disbaled please try with another passowrd');

     

      default: return const SignUpWithEmailAndPasswordFailure();
    }
  }
}