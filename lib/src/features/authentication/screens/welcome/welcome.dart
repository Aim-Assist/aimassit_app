import 'package:flutter/material.dart';
import 'package:loginsys/src/constants/colors.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/sizes.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/Signup/signup_screen.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(tDefaultSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: const AssetImage(tWelcomeImage), height: height * 0.6),
          Column(
            children: [
              Text(
                tWelcomeTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                tWelcomeSubtitle,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                },
                style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    foregroundColor: tSecondaryColor,
                    side: const BorderSide(color: tSecondaryColor),
                    padding:
                        const EdgeInsets.symmetric(vertical: tButtonHeight)),
                child: Text(tLogin.toUpperCase()),
              )),
              const SizedBox(width: 10.0),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          foregroundColor: tWhiteColor,
                          backgroundColor: tSecondaryColor,
                          side: const BorderSide(color: tSecondaryColor),
                          padding: const EdgeInsets.symmetric(
                              vertical: tButtonHeight)),
                      child: Text(tSignUp.toUpperCase()))),
            ],
          ),
        ],
      ),
    ));
  }
}
