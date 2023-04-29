// import 'package:flutter/material.dart';
// import 'dart:async';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _timerSeconds = 120;
//   bool _timerActive = false;
//   String _angleText = '0';

//   @override
//   void initState() {
//     super.initState();
//   }

//   void _startTimer() {
//     _timerActive = true;
//     Timer.periodic(Duration(seconds: 1), (Timer timer) {
//       setState(() {
//         if (_timerSeconds < 1) {
//           timer.cancel();
//           _timerActive = false;
//         } else {
//           _timerSeconds--;
//         }
//         if (_timerSeconds == 24) {
//           _angleText = '30';
//         } else if (_timerSeconds == 48) {
//           _angleText = '60';
//         } else if (_timerSeconds == 72) {
//           _angleText = '90';
//         } else if (_timerSeconds == 96) {
//           _angleText = '120';
//         } else {
//           _angleText = '0';
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Angle: $_angleText degrees',
//               style: TextStyle(fontSize: 40),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Time Remaining: $_timerSeconds seconds',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _timerActive ? null : _startTimer,
//               child: Text('Start Timer'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:math' as math;

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   int _timerSeconds = 120;
//   bool _timerActive = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(seconds: 120),
//       vsync: this,
//     );
//     _animation = Tween<double>(begin: math.pi / 6, end: math.pi * 5 / 6)
//         .animate(_controller);
//   }

//   void _startTimer() {
//     _timerActive = true;
//     _controller.reset();
//     _controller.forward();
//     Timer.periodic(Duration(seconds: 1), (Timer timer) {
//       setState(() {
//         if (_timerSeconds < 1) {
//           timer.cancel();
//           _timerActive = false;
//         } else {
//           _timerSeconds--;
//         }
//         if (_timerSeconds == 24) {
//           _controller.animateTo(math.pi / 3, duration: Duration(seconds: 24));
//         } else if (_timerSeconds == 48) {
//           _controller.animateTo(math.pi / 2, duration: Duration(seconds: 24));
//         } else if (_timerSeconds == 72) {
//           _controller.animateTo(math.pi * 2 / 3, duration: Duration(seconds: 24));
//         } else if (_timerSeconds == 96) {
//           _controller.animateTo(math.pi * 5 / 6, duration: Duration(seconds: 24));
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             RotationTransition(
//               turns: _animation,
//               child: Icon(Icons.arrow_upward, size: 100),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Time Remaining: $_timerSeconds seconds',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _timerActive ? null : _startTimer,
//               child: Text('Start Timer'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:math' as math;

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _timerSeconds = 120;
//   bool _timerActive = false;
//   double _arrowAngle = math.pi / 6;

//   @override
//   void initState() {
//     super.initState();
//   }

//   void _startTimer() {
//     _timerActive = true;
//     Timer.periodic(Duration(seconds: 1), (Timer timer) {
//       setState(() {
//         if (_timerSeconds < 1) {
//           timer.cancel();
//           _timerActive = false;
//         } else {
//           _timerSeconds--;
//           if (_timerSeconds == 24) {
//             _arrowAngle = math.pi / 3;
//           } else if (_timerSeconds == 48) {
//             _arrowAngle = math.pi / 2;
//           } else if (_timerSeconds == 72) {
//             _arrowAngle = math.pi * 2 / 3;
//           } else if (_timerSeconds == 96) {
//             _arrowAngle = math.pi * 5 / 6;
//           }
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Transform.rotate(
//               angle: _arrowAngle,
//               child: Icon(Icons.arrow_upward, size: 100),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Time Remaining: $_timerSeconds seconds',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _timerActive ? null : _startTimer,
//               child: Text('Start Timer'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:async';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _timerSeconds = 120;
//   bool _timerActive = false;
//   String _displayText = '';

//   @override
//   void initState() {
//     super.initState();
//   }

//   void _startTimer() {
//     _timerActive = true;
//     Timer.periodic(Duration(seconds: 1), (Timer timer) {
//       setState(() {
//         if (_timerSeconds < 1) {
//           timer.cancel();
//           _timerActive = false;
//           _showPopup();
//         } else {
//           _timerSeconds--;
//           if (_timerSeconds == 96) {
//             _displayText = 'Start shooting from 30 degree';
//           } else if (_timerSeconds == 72) {
//             _displayText = 'Start shooting from 60 degree';
//           } else if (_timerSeconds == 48) {
//             _displayText = 'Start shooting from 90 degree';
//           } else if (_timerSeconds == 24) {
//             _displayText = 'Start shooting from 120 degree';
//           } else {
//             _displayText = '';
//           }
//         }
//       });
//     });
//   }

//   void _showPopup() async {
//     await Future.delayed(Duration(seconds: 5));
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Congratulations!'),
//             content: Text('You are being navigated to Dashboard for analytics'),
//             actions: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               _displayText,
//               style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Time Remaining: $_timerSeconds seconds',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _timerActive ? null : _startTimer,
//               child: Text('START'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../../../../constants/colors.dart';
import '../../../../constants/image_string.dart';
import '../../../../constants/text_string.dart';
import '../Dashboard/dashboard.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);
  final double distance;
  final double device;
  const MyHomePage({super.key, required this.distance, required this.device});

  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _timerSeconds = 120;
  bool _timerActive = false;
  String _displayText = '';
  late String _token;
  late SharedPreferences prefs;
  late String email;
  late String id;
  late List _data = [];

  Future startSession() async {
    Map<String, dynamic> user = JwtDecoder.decode(_token);
    print(user["_id"]);
    email = user["email"];
    id = user["_id"];
    var res = await http
        .post(Uri.parse("https://aimassist-server.onrender.com/api/v1/session/startsession"),
            // headers: <String, String>{
            //   'Context-Type': 'application/json;charSet=UTF-8',
            // },
            body: {
          "email": email,
          "userid": id,
          'distance': "${widget.distance}",
          'device': "${widget.device}"
        });
  }

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    late String token = prefs.getString('token')!;
    setState(() {
      _token = token;
    });
  }

  void _getData() async {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
      var res = await http.get(Uri.parse(
          "https://aimassist-server.onrender.com/api/v1/session/getsession?device=${widget.device}"));
      var resBody = json.decode(res.body);
      setState(() {
        _data = resBody["data"]["score"];
      });
      print(_data);
      if (_data.length == 10) {
        timer.cancel();
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Can\'t add more than 10 scores')));
      }
    });
  }

  void _startTimer() {
    _timerActive = true;
    _timerSeconds += 1;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_timerSeconds < 1) {
          timer.cancel();
          _timerActive = false;
          _showPopup();
        } else {
          _timerSeconds--;
          if (_timerSeconds % 24 == 0) {
            if (_timerSeconds == 120) {
              _displayText = 'Start shooting from 30 degree';
            } else if (_timerSeconds == 96) {
              _displayText = 'Start shooting from 60 degree';
            } else if (_timerSeconds == 72) {
              _displayText = 'Start shooting from 90 degree';
            } else if (_timerSeconds == 48) {
              _displayText = 'Start shooting from 120 degree';
            } else if (_timerSeconds == 24) {
              _displayText = 'Start shooting from 150 degree';
            }
          }
        }
      });
    });
  }

  void _showPopup() async {
    await Future.delayed(const Duration(seconds: 5));
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Congratulations!'),
            content: const Text(
                'You are being navigated to Dashboard for analytics'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Dashboard(token: _token)),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final displayTextStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: isDarkTheme ? Colors.white : Colors.black,
    );
    final timeRemainingTextStyle = TextStyle(
      fontSize: 20,
      color: isDarkTheme ? Colors.white : Colors.black,
    );
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
                onPressed: () {},
                icon: const Image(image: AssetImage(tUserprofileImage))),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _displayText.isNotEmpty
                  ? Text(
                      _displayText,
                      key: Key(_displayText),
                      style: displayTextStyle,
                    )
                  : SizedBox.shrink(),
            ),
            SizedBox(height: 20),
            Text(
              'Time Remaining: $_timerSeconds seconds',
              style: timeRemainingTextStyle,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _timerActive ? null : _startTimer();
                startSession();
                _getData();
              },
              child: Text('START'),
            ),
            SizedBox(height: 20),
            Text("Score Board", style: displayTextStyle),
            SizedBox(height: 20),
            // if (_data.length > 0)
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
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center)),
                      TableCell(
                        child: Text('Angle',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ),
                      TableCell(
                          child: Text('Distance',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center)),
                      TableCell(
                          child: Text('Score',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center)),
                    ]),
                for (int i = 1; i <= _data.length; i++)
                  TableRow(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 252, 238, 238),
                      ),
                      children: [
                        TableCell(
                            child: Text(
                          '$i',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        )),
                        TableCell(
                            child: Text(
                                i - 1 < 2
                                    ? "30"
                                    : i - 1 < 4
                                        ? "60"
                                        : i - 1 < 6
                                            ? "90"
                                            : i - 1 < 8
                                                ? "120"
                                                : "150",
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center)),
                        TableCell(
                            child: Text('${widget.distance}',
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center)),
                        TableCell(
                            child: Text('${_data[i - 1][2]}',
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center)),
                      ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
