import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/sizes.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/startsession/Dashboard1.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/login_screen.dart';

import '../../Controllers/login_controllers.dart';
import '../Dashboard/dashboard.dart';
class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
        final controller = Get.put(LoginController());
        final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      
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
              onPressed: (){
                if(_formKey.currentState!.validate()){
                      // LoginController.instance.loginUser(controller.email.text.trim(), controller.password.text.trim());
                      LoginController.instance.loginUser(controller.email.text, controller.password.text);

                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Dashboard()));
                    }
              },
              child: Text(tLogin.toUpperCase()
              )
              ),
          )
        ],
                    ),
      ),);
  }
}