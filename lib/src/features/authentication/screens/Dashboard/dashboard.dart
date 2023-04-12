import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loginsys/src/common_widgets/form/form_header_widget.dart';
import 'package:loginsys/src/constants/colors.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/sizes.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/screens/Signup/widgets/signup_form_widget.dart';
import 'package:loginsys/src/common_widgets/BarChart/bar_chart.dart';
import 'package:loginsys/src/common_widgets/BarChart/bar_model.dart';
import 'package:http/http.dart' as http;
import 'package:loginsys/src/features/authentication/screens/welcome/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  // const Dashboard({super.key, required token, this.token});
  final token;
  const Dashboard({super.key, @required this.token});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String email;
  late String name;
  late String id;
  late SharedPreferences prefs;

void initState() {
    super.initState();
    // print(JwtDecoder.isExpired(widget.token));
    Map<String, dynamic> jwtDecoded = JwtDecoder.decode(widget.token);
    print(jwtDecoded);
    email = jwtDecoded['email'];
    name = jwtDecoded['name'];
    id = jwtDecoded['_id'];
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future save() async {
    var res = await http.post(
        Uri.parse("http://localhost:8000/api/v1/user/logout"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8',
        },
        body: <String, String>{
          '_id': id, 
        });
    // ignore: avoid_print
    print(res.body);
    prefs.remove('token');
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  const Icon(Icons.menu, color: Colors.black),
        title: Text(tAppname, style: Theme.of(context).textTheme.headline4,),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: tCardBgColor),
            child: IconButton(onPressed: (){},icon: const Image(image: AssetImage(tUserprofileImage))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text("Welcome $name", style: Theme.of(context).textTheme.headlineSmall),
              // Text(tDashboardTitle, style: Theme.of(context).textTheme.bodyMedium),
              Text(tDashboardHeading, style: Theme.of(context).textTheme.headlineLarge),
              const BarChart(),
              ElevatedButton(onPressed: (){
                save();
              }, child: const Text("Logout")),
            ]
          )
        ),
        ),
    );
  }
}
