import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loginsys/src/common_widgets/LineChart/line_Chart.dart';
import 'package:loginsys/src/common_widgets/form/form_header_widget.dart';
import 'package:loginsys/src/constants/colors.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/sizes.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/widgets/Scrollable.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/widgets/prevsessionbutton.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/widgets/startbuttoncard.dart';
import 'package:loginsys/src/features/authentication/screens/Profile/profile.dart';
import 'package:loginsys/src/features/authentication/screens/Sessions/session.dart';
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
  late List barData = [];
  late List lineData = [];
  late Map<String, dynamic> user;
  late Map<int, int> freq;

  Future getBarData() async {
    var res = await http.get(
        Uri.parse("http://localhost:8000/api/v1/user/getUser?id=$id"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8',
        });

    user = jsonDecode(res.body);
    for (var i = 0; i < 10; i++) {
      barData.add(user['data']['latest_score'][i][2]);
    }
    for (var i = 0; i < 5; i++) {
      lineData.add(user['data']['latestfrequency']["${i+1}"]);
    }
    setState(() {
      DashboardCategoriesModel.list.add(DashboardCategoriesModel("Accuracy",
          "Score", "${user['data']["latestroundData"]["accuracy"]}", null));
      DashboardCategoriesModel.list.add(DashboardCategoriesModel("Distance",
          "Score", "${user['data']["latestroundData"]["distance"]}", null));
      DashboardCategoriesModel.list.add(DashboardCategoriesModel("Best Angle",
          "Angle", "${user['data']["latestroundData"]["bestangle"]}", null));
      DashboardCategoriesModel.list.add(DashboardCategoriesModel("Worst Angle",
          "Angle", "${user['data']["latestroundData"]["worstangle"]}", null));
    });
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
    prefs.remove('token');
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
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
                      builder: (context) => const FullScreenUI()));
                },
                icon: const Image(image: AssetImage(tUserprofileImage))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(tDashboardPadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Text(tDashboardTitle,
              //     style: Theme.of(context).textTheme.bodyMedium),
              Text(tDashboardHeading,
                  style: Theme.of(context).textTheme.headlineLarge),

              SizedBox(height: 6),

              DashboardScrollable(
                list2: DashboardCategoriesModel.list,
              ),

              SizedBox(height: 6),

              JourneyCard(),

              SizedBox(height: 6),

              PreJourneyCard(),

              SizedBox(height: 6),

              Text("Your Latest Score",
                  style: Theme.of(context).textTheme.headlineSmall),
              Barchart(userData: barData),

              SizedBox(height: 6),

              Text("Your Latest Sessions Frequency",
                  style: Theme.of(context).textTheme.headlineSmall),
              LineChartWidget(userData: lineData),
            ])),
      ),
    );
  }
}

class DashboardCategoriesModel {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategoriesModel(
      this.title, this.heading, this.subHeading, this.onPress);

  static List<DashboardCategoriesModel> list = [];
}
