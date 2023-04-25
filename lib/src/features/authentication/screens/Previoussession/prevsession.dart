import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loginsys/src/constants/colors.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/screens/Profile/profile.dart';
import 'package:loginsys/src/features/authentication/screens/Previoussession/session_detail.dart';
import 'package:loginsys/src/features/authentication/screens/Previoussession/session_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PreviousSessionsScreen extends StatefulWidget {
  PreviousSessionsScreen({super.key});

  @override
  State<PreviousSessionsScreen> createState() => _PreviousSessionsScreenState();
}

class _PreviousSessionsScreenState extends State<PreviousSessionsScreen> {
  List _sessiondata = [];
  late String _token;
  late String _id;
  late SharedPreferences prefs;
  late Map<String, dynamic> sessions;
  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token')!;
    Map<String, dynamic> jwtDecoded = JwtDecoder.decode(_token);
    _id = jwtDecoded['_id'];
    print(_id);
    var res = await http.get(
        Uri.parse("http://localhost:8000/api/v1/round/getUserRounds/$_id"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8',
        });

    print("Response hai");
    sessions = jsonDecode(res.body);
    // set state of session data
    setState(() {
      _sessiondata = sessions['data'];
    });
    // _sessiondata = sessions['data'];
    print(_sessiondata);
  }

  void initState() {
    super.initState();
    getToken();
    // save();
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
      body: Card(
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Your previous session',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Results',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _sessiondata.length,
                itemBuilder: (context, index) {
                  final session = _sessiondata[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SessionDetailScreen(
                            sessionNumber: index+1,
                            // avgScore: session.avgScore.toDouble(),
                            avgScore: 60,
                            scores: session['scores'].toList(growable: false),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      // color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Session ${index+1}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Your avg score: 60',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
