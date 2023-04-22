// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsys/src/features/authentication/Controllers/signup_controller.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/dashboard.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/Signup/widgets/signup_form_widget.dart';
import 'package:loginsys/src/constants/colors.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/sizes.dart';
import 'package:loginsys/src/constants/text_string.dart';


class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight-10),
      child: Form(
        key: _formKey,

        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                label: Text(tFullName,
                style: TextStyle(
                  color: Colors.white,
                ),),
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  
                color: tSecondaryColor,),
                labelStyle: TextStyle(color: tSecondaryColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: tSecondaryColor)
                )

              ),
              ),
              const SizedBox(height: tFormHeight-20),

            TextFormField(
              controller: controller.email,

              decoration: const InputDecoration(
                label: Text(tEmail,
                style: TextStyle(
                  color: Colors.white,
                ),),
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  
                color: tSecondaryColor,),
                labelStyle: TextStyle(color: tSecondaryColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: tSecondaryColor)
                )

              ),
              ),
              const SizedBox(height: tFormHeight-20),

              TextFormField(
                controller: controller.phoneNo,
              decoration: const InputDecoration(
                label: Text(tPhoneNo,
                style: TextStyle(
                  color: Colors.white,
                ),),
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  
                color: tSecondaryColor,),
                labelStyle: TextStyle(color: tSecondaryColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: tSecondaryColor)
                )

              ),
              ),
              const SizedBox(height: tFormHeight-20),


              TextFormField(
                controller: controller.password,
              decoration: const InputDecoration(
                label: Text(tpassword, 
                style: TextStyle(
                  color: Colors.white,
                ),),

                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  
                color: tSecondaryColor,),
                labelStyle: TextStyle(color: tSecondaryColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: tSecondaryColor)
                )

              ),
              ),
              const SizedBox(height: tFormHeight-20),
              SizedBox(height: 20,),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Dashboard()));
                    }
                  }, 
                  child: Text(tSignUp.toUpperCase())),
              )



        ],
      ),),
    );
  }
}