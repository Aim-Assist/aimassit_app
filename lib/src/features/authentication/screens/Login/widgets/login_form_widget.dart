import 'package:flutter/material.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/sizes.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/screens/Login/login_screen.dart';
class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight -10.0) ,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline_outlined),
              labelText: tEmail,
              hintText: tEmail,
              border: OutlineInputBorder()
            ),
          ),


          SizedBox(height: tFormHeight,),


          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.fingerprint),
              labelText: tpassword,
              hintText: tpassword,
              border: OutlineInputBorder(),
              suffixIcon: IconButton(onPressed: null,
              icon: Icon(Icons.remove_red_eye_sharp))
            ),
          ),



          const SizedBox(height: tFormHeight -20),

          Align(
            alignment: Alignment.centerRight, 
            child: TextButton(
              onPressed: (){}, 
              child: Text(tForgetPassword),
          )),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){},
              child: Text(tLogin.toUpperCase()
              )
              ),
          )
        ],
                    ),
      ),);
  }
}