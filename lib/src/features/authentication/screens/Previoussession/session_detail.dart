import 'package:flutter/material.dart';
import 'package:loginsys/src/constants/colors.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/screens/Profile/profile.dart';

import '../../../../common_widgets/BarChart/bar_chart.dart';

class SessionDetailScreen extends StatefulWidget {
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
  State<SessionDetailScreen> createState() => _SessionDetailScreenState();
}

class _SessionDetailScreenState extends State<SessionDetailScreen> {
  @override
  late List sessiondata;
  void initState() {
    super.initState();
    sessiondata = [];
    for (int i = 0; i < widget.scores.length; i++) {
      sessiondata.add(widget.scores[i][2]);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
        child: Card(
          margin: EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Session ${widget.sessionNumber}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Text(
                  'Avg Score: ${widget.avgScore.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Table(
                  border: const TableBorder(
                    horizontalInside: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    verticalInside: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    top: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    bottom: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  children: [
                    const TableRow(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 252, 238, 238),
                        ),
                        children: [
                          TableCell(
                              child: Text('Index',
                              
                                  style:
                                      TextStyle(color: Colors.black,fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                          TableCell(
                            child: Text('Angle',
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                          ),
                          TableCell(
                              child: Text('Distance',
                                  style:
                                      TextStyle(color: Colors.black,fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                          TableCell(
                              child: Text('Score',
                                  style:
                                      TextStyle(color: Colors.black,fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                        ]),
                    for (int i = 1; i <= widget.scores.length; i++)
                      TableRow(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 252, 238, 238),
                          ),
                          children: [
                            TableCell(child: Text('$i', style: TextStyle(color: Colors.black),textAlign: TextAlign.center,)),
                            TableCell(child: Text('${widget.scores[i - 1][0]}',style: TextStyle(color: Colors.black), textAlign: TextAlign.center)),
                            TableCell(child: Text('${widget.scores[i - 1][1]}',style: TextStyle(color: Colors.black), textAlign: TextAlign.center)),
                            TableCell(child: Text('${widget.scores[i - 1][2]}',style: TextStyle(color: Colors.black), textAlign: TextAlign.center)),
                          ]),
                  ],
                ),
                SizedBox(height: 20),
                const Text(
                  'Graphical Representation',
                  style: TextStyle(fontSize: 18),
                ),
                Barchart(
                  userData: sessiondata,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
