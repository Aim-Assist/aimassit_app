import 'package:flutter/material.dart';
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight-10),
      child: Form(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(tFullName),
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
              decoration: const InputDecoration(
                label: Text(tEmail),
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
              decoration: const InputDecoration(
                label: Text(tPhoneNo),
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
              decoration: const InputDecoration(
                label: Text(tpassword),
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

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: Text(tSignUp.toUpperCase())),
              )



        ],
      ),),
    );
  }
}