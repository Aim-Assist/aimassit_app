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

import 'package:flutter/material.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/Profile/profile.dart';
import 'dart:async';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_string.dart';
import '../../../../../constants/text_string.dart';
import '../dashboard.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);
  const MyHomePage({super.key});

  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _timerSeconds = 120;
  bool _timerActive = false;
  String _displayText = '';

  @override
  void initState() {
    super.initState();
  }

  void _startTimer() {
    _timerActive = true;
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
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
    await Future.delayed(Duration(seconds: 5));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Congratulations!'),
            content: Text('You are being navigated to Dashboard for analytics'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Dashboard()
                      ));
                },
                child: Text('OK'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              onPressed: _timerActive ? null : _startTimer,
              child: Text('START'),
            ),
          ],
        ),
      ),
    );
  }
}
