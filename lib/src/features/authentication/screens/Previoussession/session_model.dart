import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

List<SessionModel> sessionData = [
  SessionModel(
      sessionNumber: 1,
      avgScore: 80,
      scores: [85, 78, 92, 80, 90, 88, 75, 82, 87, 93]),
  SessionModel(
      sessionNumber: 2,
      avgScore: 90,
      scores: [85, 78, 92, 80, 90, 88, 75, 82, 87, 93]),
  SessionModel(
      sessionNumber: 3,
      avgScore: 85,
      scores: [85, 78, 92, 80, 90, 88, 75, 82, 87, 93]),
  SessionModel(
      sessionNumber: 4,
      avgScore: 75,
      scores: [85, 78, 92, 80, 90, 88, 75, 82, 87, 93]),
  SessionModel(
      sessionNumber: 5,
      avgScore: 95,
      scores: [85, 78, 92, 80, 90, 88, 75, 82, 87, 93]),
  SessionModel(
      sessionNumber: 6,
      avgScore: 87,
      scores: [85, 78, 92, 80, 90, 88, 75, 82, 87, 93]),
  SessionModel(
      sessionNumber: 7,
      avgScore: 78,
      scores: [85, 78, 92, 80, 90, 88, 75, 82, 87, 93]),
  SessionModel(
      sessionNumber: 8,
      avgScore: 83,
      scores: [85, 78, 92, 80, 90, 88, 75, 82, 87, 93]),
  SessionModel(
      sessionNumber: 9,
      avgScore: 91,
      scores: [85, 78, 92, 80, 90, 88, 75, 82, 87, 93]),
  SessionModel(
      sessionNumber: 10,
      avgScore: 88,
      scores: [85, 78, 92, 80, 90, 88, 75, 82, 87, 93]),
];

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late String _token;
  late String id;
  late SharedPreferences prefs;

  void getToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token')!;
    Map<String, dynamic> jwtDecoded = JwtDecoder.decode(_token);
    id = jwtDecoded['_id'];
  }

  Future save() async {
    var res = await http.post(
        Uri.parse(
            "https://aimassist-server.onrender.com/api/v1/round/getUserRounds/$_token"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8',
        });

    print(res);
    // ignore: avoid_print
    // ignore: use_build_context_synchronously
  }

  void initState() {
    super.initState();
    getToken();
    save();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SessionModel {
  final int sessionNumber;
  final int avgScore;
  final List<double> scores;

  SessionModel(
      {required this.sessionNumber,
      required this.avgScore,
      required this.scores});
}



// class SessionModel {
//   final int sessionNumber;
//   final List<double> scores;

//   SessionModel({required this.sessionNumber, required this.scores});

//   double get avgScore => scores.fold(0, (sum, score) => sum + score) / 10;
// }

// List<SessionModel> sessionData = [
//   SessionModel(sessionNumber: 1, scores: [85, 78, 92, 80, 90, 88, 75, 82, 87, 93]),
//   SessionModel(sessionNumber: 2, scores: [92, 88, 79, 85, 90, 93, 91, 84, 86, 89]),
//   SessionModel(sessionNumber: 3, scores: [78, 83, 87, 91, 89, 84, 90, 92, 81, 88]),
//   SessionModel(sessionNumber: 4, scores: [79, 85, 90, 88, 83, 92, 86, 87, 81, 89]),
//   SessionModel(sessionNumber: 5, scores: [90, 92, 86, 79, 85, 88, 83, 81, 87, 89]),
//   SessionModel(sessionNumber: 6, scores: [88, 91, 85, 84, 87, 83, 89, 92, 90, 82]),
//   SessionModel(sessionNumber: 7, scores: [86, 92, 87, 81, 79, 83, 89, 90, 84, 88]),
//   SessionModel(sessionNumber: 8, scores: [79, 88, 91, 82, 90, 83, 85, 87, 89, 86]),
//   SessionModel(sessionNumber: 9, scores: [87, 91, 89, 83, 84, 88, 80, 86, 92, 85]),
//   SessionModel(sessionNumber: 10, scores: [82, 84, 88, 90, 86, 83, 89, 91, 85, 87]),
// ];

// class SessionModel {
//   final int sessionNumber;
//   final List<double> scores;

//   SessionModel({required this.sessionNumber, required this.scores});

//   double get avgScore => scores.fold(0, (sum, score) => (sum + score)) / 10;
// }

// List<SessionModel> sessionData = [
//   SessionModel(sessionNumber: 1, scores: [80, 82, 85, 78, 81, 77, 89, 84, 76, 79]),
//   SessionModel(sessionNumber: 2, scores: [90, 88, 86, 92, 89, 93, 91, 87, 90, 94]),
//   SessionModel(sessionNumber: 3, scores: [85, 81, 83, 87, 89, 84, 86, 88, 80, 82]),
//   SessionModel(sessionNumber: 4, scores: [75, 78, 72, 81, 76, 79, 80, 74, 77, 73]),
//   SessionModel(sessionNumber: 5, scores: [95, 92, 93, 94, 98, 97, 96, 91, 95, 99]),
//   SessionModel(sessionNumber: 6, scores: [87, 88, 83, 84, 89, 86, 82, 85, 88, 90]),
//   SessionModel(sessionNumber: 7, scores: [78, 82, 84, 79, 77, 81, 80, 85, 83, 76]),
//   SessionModel(sessionNumber: 8, scores: [83, 87, 85, 82, 88, 84, 86, 89, 81, 80]),
//   SessionModel(sessionNumber: 9, scores: [91, 95, 94, 90, 92, 93, 89, 96, 91, 95]),
//   SessionModel(sessionNumber: 10, scores: [88, 82, 84, 85, 87, 81, 89, 83, 86, 88]),
// ];
