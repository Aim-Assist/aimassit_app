// import 'package:flutter/material.dart';
// import 'package:loginsys/src/features/authentication/screens/Dashboard/startsession/Dashboard1.dart';

// class JourneyCard extends StatelessWidget {
//   const JourneyCard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Row(
//           children: [
//             Expanded(
//               flex: 3,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Start your journey now',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue.shade800,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Icon(
//                     Icons.arrow_right_alt,
//                     color: Colors.blue.shade800,
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const MyHomePage()
//                       ));
//                   },
//                   child: Text(
//                     'Start Session',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue.shade800,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 12,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:loginsys/src/features/authentication/screens/Dashboard/startsession/Dashboard1.dart';

// class JourneyCard extends StatelessWidget {
//   const JourneyCard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Color(0xFF191970),
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Row(
//           children: [
//             Expanded(
//               flex: 3,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Start your Aimassist journey ',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Icon(
//                     Icons.arrow_right_alt,
//                     color: Colors.white,
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const MyHomePage()));
//                   },
//                   child: Text(
//                     'Start Session',
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Color(0xFFFF9B21),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 12,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:loginsys/src/features/authentication/screens/Sessions/session.dart';

class JourneyCard extends StatefulWidget {
  const JourneyCard({Key? key}) : super(key: key);

  @override
  _JourneyCardState createState() => _JourneyCardState();
}

class _JourneyCardState extends State<JourneyCard> {
  double _distance = 0;
  double _device = 0;

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Distance and Device'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Distance',
                ),
                onChanged: (value) {
                  _distance = double.parse(value);
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Device',
                ),
                onChanged: (value) {
                  _device = double.parse(value);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(device: _device, distance: _distance,),
                  ),
                );
              },
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF191970),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Start your Aimassist journey ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    _showDialog(context);
                  },
                  child: const Text(
                    'Start Session',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFF9B21),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
