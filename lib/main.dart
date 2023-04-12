import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsys/firebase_options.dart';
import 'package:loginsys/src/BarChart/bar_chart.dart';
import 'package:loginsys/src/features/authentication/authentication_repository.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/dashboard.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/startsession/Dashboard1.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/Signup/signup_screen.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/login_screen.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/welcome.dart';
import 'package:loginsys/src/utils/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value)=> Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const WelcomeScreen(),
    );
  }
}


