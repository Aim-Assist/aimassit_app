import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loginsys/src/common_widgets/LineChart/line_Chart.dart';
import 'package:loginsys/src/constants/colors.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/app/pages/post_Screen.dart';
import 'package:http/http.dart' as http;
import 'package:loginsys/src/features/authentication/screens/Dashboard/dashboard.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/user_activity_info.dart';
import '../widgets/user_info_widget.dart';
import '../widgets/user_profile_image.dart';
import 'articles_Screen.dart';
import 'gallery_Screen.dart';

class MyHomePage1 extends StatefulWidget {
  final String token;
  const MyHomePage1({Key? key, required this.token}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage1> {
  int _selectedEvent = 0;
  late String email;
  late String name;
  late String phone = "9326731930";
  late String id;
  late SharedPreferences prefs;
  late Map<String, dynamic> user;
  late List linedata = [];
  late Map<String, String> userData = {
    "accuracy": "",
    "bestangle": "",
    "worstangle": "",
  };

  List<Widget> _pages = [GalleryScreen(), PostScreen(), ArticlesScreen()];
  Future getBarData() async {
    var res = await http.get(Uri.parse(
        "https://aimassist-server.onrender.com/api/v1/user/getUser?id=$id"));
    // headers: <String, String>{
    //   'Context-Type': 'application/json;charSet=UTF-8',
    // });

    user = jsonDecode(res.body);
    setState(() {
      // phone = user['data']['phoneno'];
      userData['accuracy'] = user['data']['latestroundData']['accuracy']
          .toString()
          .substring(0, 5);
      userData['bestangle'] =
          user['data']['latestroundData']['bestangle'].toString();
      userData['worstangle'] =
          user['data']['latestroundData']['worstangle'].toString();
      for (int i = 0; i < user['data']['prev_accuracy'].length; i++) {
        linedata.add(user['data']['prev_accuracy'][i]);
      }
    });
  }

  Future save() async {
    var res = await http.post(
        Uri.parse("https://aimassist-server.onrender.com/api/v1/user/logout"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8',
        },
        body: <String, String>{
          '_id': id,
        });
    // ignore: avoid_print
    prefs.remove('token');
    // ignore: use_build_context_synchronously
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }

  void initState() {
    super.initState();
    // print(JwtDecoder.isExpired(widget.token));
    Map<String, dynamic> jwtDecoded = JwtDecoder.decode(widget.token);
    email = jwtDecoded['email'];
    name = jwtDecoded['name'];
    id = jwtDecoded['_id'];
    initSharedPref();
    getBarData();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.black),
        title: Text(
          tAppname,
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: tCardBgColor),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyHomePage1(
                            token: widget.token,
                          )));
                },
                icon: const Image(image: AssetImage(tUserprofileImage))),
          )
        ],
      ),
      // set icon color of drawer black
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildUserImage(size),

              // * 3 user Name
              buildUserInfo(email: email, name: name, phone: phone),

              //* 4 total no. of posts, followers, following (Row Widget)
              buildUserActivity(userData: userData),

              const SizedBox(height: 10),
              const Text("User Progress",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              LineChartWidget(userData: linedata),

              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Dashboard(
                              token: widget.token,
                            )));
                  },
                  child: const Text("Dashboard")),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    save();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WelcomeScreen()));
                  },
                  child: const Text("Logout")),

              // * 5 follow and message button (Row widget)
              // buildUserEvents(size),

              // *
              // _pages[_selectedEvent],
            ],
          ),
        ),
      ),
    );
  }

  Container buildUserEvents(Size size) {
    return Container(
      // color: Colors.grey.shade100,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: const EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue.shade700)),
                color:
                    _selectedEvent == 0 ? Colors.blue.shade700 : Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 0;
                  });
                },
                child: Text("Gallery",
                    style: TextStyle(
                      color: _selectedEvent == 0
                          ? Colors.white
                          : Colors.blue.shade700,
                    )),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: const EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue.shade700)),
                color:
                    _selectedEvent == 1 ? Colors.blue.shade700 : Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 1;
                  });
                },
                child: Text("Posts",
                    style: TextStyle(
                      color: _selectedEvent == 1
                          ? Colors.white
                          : Colors.blue.shade700,
                    )),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: const EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue.shade700)),
                color:
                    _selectedEvent == 2 ? Colors.blue.shade700 : Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 2;
                  });
                },
                child: Text("Articles",
                    style: TextStyle(
                      color: _selectedEvent == 2
                          ? Colors.white
                          : Colors.blue.shade700,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
