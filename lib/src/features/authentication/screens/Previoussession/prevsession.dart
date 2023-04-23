// prevsession.dart
import 'package:flutter/material.dart';
import 'package:loginsys/src/constants/colors.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/screens/Profile/profile.dart';
import 'package:loginsys/src/features/authentication/screens/Previoussession/session_detail.dart';
import 'package:loginsys/src/features/authentication/screens/Previoussession/session_model.dart';

class PreviousSessionsScreen extends StatelessWidget {
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
            child: IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FullScreenUI()
                      ));
            },icon: const Image(image: AssetImage(tUserprofileImage))),
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
                itemCount: sessionData.length,
                itemBuilder: (context, index) {
                  final session = sessionData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SessionDetailScreen(
                            sessionNumber: session.sessionNumber,
                            avgScore: session.avgScore.toDouble(),
                            scores: session.scores.toList(growable: false),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      // color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Session ${session.sessionNumber}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Your avg score: ${session.avgScore}',
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
