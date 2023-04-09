import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loginsys/src/features/authentication/controller/user.dart';
import 'package:loginsys/src/features/authentication/screens/Login/login_screen.dart';
import 'package:loginsys/src/features/authentication/screens/Signup/widgets/signup_form_widget.dart';
import 'package:loginsys/src/constants/colors.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/sizes.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:http/http.dart' as http;

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _formKey = GlobalKey<FormState>();

  Future createAlbum(
      String name, String email, String phoneno, String password) async {
    var res = await http.post(
      Uri.parse('https://aimassist-server.onrender.com/api/v1/user/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'phoneno': phoneno,
        'password': password
      }),
    );
  }

  Future save() async {
    var res = await http.post(
        Uri.parse("https://aimassist-server.onrender.com/api/v1/user/signup"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8',
        },
        body: <String, String>{
          'name': user.name,
          'email': user.email,
          'phoneno': user.phoneno,
          'password': user.password
        });
    // ignore: avoid_print
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  User user = User("", "", "", "");
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: TextEditingController(text: user.name),
              onChanged: (value) => user.name = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: tSecondaryColor,
                  ),
                  labelStyle: TextStyle(color: tSecondaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2.0, color: tSecondaryColor))),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: TextEditingController(text: user.email),
              onChanged: (value) => user.email = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                } else if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value) ==
                    false) {
                  return "Please enter a valid email";
                }
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(tEmail),
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: tSecondaryColor,
                  ),
                  labelStyle: TextStyle(color: tSecondaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2.0, color: tSecondaryColor))),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: TextEditingController(text: user.phoneno),
              onChanged: (value) => user.phoneno = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your phone number";
                } else if (RegExp(r"^[0-9]{10}$").hasMatch(value) == false) {
                  return "Please enter a valid phone number";
                }
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(tPhoneNo),
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: tSecondaryColor,
                  ),
                  labelStyle: TextStyle(color: tSecondaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2.0, color: tSecondaryColor))),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: TextEditingController(text: user.password),
              onChanged: (value) => user.password = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(tpassword),
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: tSecondaryColor,
                  ),
                  labelStyle: TextStyle(color: tSecondaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2.0, color: tSecondaryColor))),
            ),
            const SizedBox(height: tFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // ignore: avoid_print
                      print("Validated");
                      print(user.name);
                      print(user.email);
                      print(user.phoneno);
                      print(user.password);
                      // createAlbum(
                      //     user.name, user.email, user.phoneno, user.password);
                      save();
                    } else {
                      // ignore: avoid_print
                      print("Not Validated");
                    }
                  },
                  child: Text(tSignUp.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }
}
