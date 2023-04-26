import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/sizes.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/controller/login.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/dashboard.dart';
import 'package:loginsys/src/features/authentication/screens/Sessions/session.dart';
import 'package:loginsys/src/features/authentication/screens/Login/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isNotValid = false;
  late SharedPreferences prefs;

  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future save() async {
    var res = await http.post(
        Uri.parse("http://localhost:8000/api/v1/user/login"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8',
        },
        body: <String, String>{
          'email': loginUser.email,
          'password': loginUser.password
        });
    // ignore: avoid_print
    var jsonRes = jsonDecode(res.body);
    if (jsonRes['success'] == true) {
      prefs.setString('token', jsonRes['token']);
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard(token: jsonRes['token'],)));
    } else {
      setState(() {
        _isNotValid = true;
      });
    }
  }

  LoginUser loginUser = LoginUser("", "");
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: TextEditingController(text: loginUser.email),
              onChanged: (value) => loginUser.email = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value) ==
                    false) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: tEmail,
                  hintText: tEmail,
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: tFormHeight,
            ),
            TextFormField(
              controller: TextEditingController(text: loginUser.password),
              onChanged: (value) => loginUser.password = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: tpassword,
                  hintText: tpassword,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: null, icon: Icon(Icons.remove_red_eye_sharp))),
            ),
            const SizedBox(height: tFormHeight - 20),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(tForgetPassword),
                )),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')));
                      print(loginUser.email);
                      print(loginUser.password);
                      save();
                    }
                  }, child: Text(tLogin.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }
}
