import 'package:flutter/material.dart';
import 'package:loginsys/src/common_widgets/form/form_header_widget.dart';
import 'package:loginsys/src/constants/colors.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/sizes.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/screens/Signup/widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children:[ const 
                FormHeaderWidget(
                  image: tWelcomeImage, 
                  title: tSignUpTitle, 
                  subTitle: tSignUpSubTitle),

                  const SignUpFormWidget(),

                  Column(
                    children: [
                      const Text("OR"),
                      SizedBox(
                        width:double.infinity,
                        child: OutlinedButton.icon(onPressed: (){}, 
                        icon: const Image(image: AssetImage(tGoogleLogoImage),width: 20.0,),
                        label: Text(tSignInWithGoogle.toUpperCase()),
                        ),
                      ),
                      TextButton(onPressed: (){}, 
                      child: Text.rich(TextSpan(
                      children:[
                        TextSpan(text: tAlreadyHaveAnAccount, style: Theme.of(context).textTheme.bodyText1),
                        TextSpan(text: tLogin.toUpperCase())
                      ]
                      )
                      )
                      )

                    ]
                  
                  )

                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}

