import 'package:flutter/material.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/sizes.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/login_form_widget.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/login_header_widget.dart';




class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Image(image: AssetImage(tGoogleLogoImage),width:20.0),
            onPressed: (){}, 
            label: Text(tSignInWithGoogle)),
        ),
        const SizedBox(
          height: tFormHeight -20,
        ),
        TextButton(onPressed: (){}, 
        child: Text.rich(
          TextSpan(
            text: tDontHaveAnAccount,
            style: Theme.of(context).textTheme.bodyLarge,
            children: const [
              TextSpan(
                text: tSignUp,
                style: TextStyle(color: Color.fromARGB(255, 2, 49, 103))
                )
            ]
            
            )),
        )

      ],
    );
  }
}
