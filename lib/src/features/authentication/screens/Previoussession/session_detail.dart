import 'package:flutter/material.dart';
import 'package:loginsys/src/constants/colors.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/screens/Profile/profile.dart';

class SessionDetailScreen extends StatelessWidget {
  final int sessionNumber;
  final double avgScore;
  final List<dynamic> scores;

  const SessionDetailScreen(
      {Key? key,
      required this.sessionNumber,
      required this.avgScore,
      required this.scores})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(tAppname, style: Theme.of(context).textTheme.headline4,),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: tCardBgColor),
            child: IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FullScreenUI()
                      ));
            },icon: const Image(image: AssetImage(tUserprofileImage))),
          )
        ],
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Session $sessionNumber',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Text(
                  'Avg Score: ${avgScore.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'Scores: ${scores.join(", ")}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
