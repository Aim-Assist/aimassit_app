import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loginsys/src/common_widgets/BarChart/bar_chart.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/dashboard.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/session.dart';
import 'package:loginsys/src/features/authentication/screens/Signup/signup_screen.dart';
import 'package:loginsys/src/features/authentication/screens/Login/login_screen.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/welcome.dart';
import 'package:loginsys/src/utils/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final token;
  const MyApp({@required this.token, Key? key}) : super(key: key);
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: (token == null) ? const WelcomeScreen() : Dashboard(token: token),
      // home: const MyHomePage(),
    );
  }
}