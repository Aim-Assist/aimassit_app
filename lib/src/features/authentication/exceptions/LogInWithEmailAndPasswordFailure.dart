import 'package:flutter/foundation.dart';

class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure([this.message ="An error has occured"]);

  factory LogInWithEmailAndPasswordFailure.code(String code){
    switch(code){

      case 'weak-password':
      return const LogInWithEmailAndPasswordFailure('Plesase enter a stronger password');

      case 'invalid-email':
      return const LogInWithEmailAndPasswordFailure('Email is not valid or badly formed');

      case 'email-already-in-use':
      return const LogInWithEmailAndPasswordFailure('An account already exists for the same email id');

      case 'operation-not-allowed':
      return const LogInWithEmailAndPasswordFailure('Operation is not valid. please try again');

      case 'user-disabled':
      return const LogInWithEmailAndPasswordFailure('User is disbaled please try with another passowrd');

     

      default: return const LogInWithEmailAndPasswordFailure();
    }
  }

  static fromCode(String code) {}
}