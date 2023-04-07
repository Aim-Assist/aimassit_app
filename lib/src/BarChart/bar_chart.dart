

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:charts_flutter/flutter.dart' as charts;

import 'Bar_model.dart';
// import 'dart:ffi';

class BarChart extends StatelessWidget {
  const BarChart({Key? key}) : super(key:key);

  static List<charts.Series<Barmodel, String>> _createSampleData(){
    final data = [
      Barmodel("1",5),
      Barmodel("2",4),
      Barmodel("3",4),
      Barmodel("4",4),
      Barmodel("5",4),
      Barmodel("6",4),
      Barmodel("7",4),
      Barmodel("8",4),
      Barmodel("9",5),
      Barmodel("10",5),

    ];
    return[
      charts.Series<Barmodel, String>(
        data: data,
        id: 'Currewnt Session',
        colorFn: (_, __)=> charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Barmodel barModel1, _) => barModel1.bullet,
        measureFn: (Barmodel barModel1, _) => barModel1.score, 
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // width: double.infinity,
        height: 300,
        child: charts.BarChart(
          _createSampleData(),
          

        ),
      );
    
    
  }
}