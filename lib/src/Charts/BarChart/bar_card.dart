import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

import 'bar_chart.dart';


// import 'package:loginsys/src/Charts/BarChart/bar_chart.dart';


class Barchartcard extends StatelessWidget {
  const Barchartcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Latest Session shoot',
              
            ),
          ),
          // Expanded(
          //   child: Barchart(),
          // ),
        ],
      ),
    );
  }
}
