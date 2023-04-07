import 'package:flutter/material.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/sizes.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/screens/Login/widgets/login_form_widget.dart';
import 'package:loginsys/src/features/authentication/screens/Login/widgets/login_header_widget.dart';
import 'package:loginsys/src/features/authentication/screens/Login/widgets/login_footer_widget.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: const [
              LoginHeaderWidget(),

              LoginForm(),

              LoginFooterWidget()

            ],
          ),
        ),
      ),
    );
  }
}
