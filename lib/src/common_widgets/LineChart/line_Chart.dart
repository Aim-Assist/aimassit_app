import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'Line_model.dart';

class LineChartWidget extends StatelessWidget {
  // final List<charts.Series<LineModel, int>> seriesList;
  

  // const LineChartWidget(this.seriesList, {this.animate = true});

  static List<charts.Series<LineModel, int>> _createSampleData() {
    final data = [
      LineModel(0, 10),
      LineModel(1, 20),
      LineModel(2, 30),
      LineModel(3, 40),
      LineModel(4, 50),
      LineModel(5, 60),
      LineModel(6, 70),
      LineModel(7, 80),
      LineModel(8, 90),
      LineModel(9, 100),
    ];

    return [
      charts.Series<LineModel, int>(
        id: 'Accuracy',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LineModel lineModel, _) => lineModel.session,
        measureFn: (LineModel lineModel, _) => lineModel.accuracy,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 300,
          child: charts.LineChart(
          //   seriesList,
            _createSampleData(),
            animate: true,
            primaryMeasureAxis: charts.NumericAxisSpec(
              tickProviderSpec:
                  charts.BasicNumericTickProviderSpec(desiredTickCount: 6),
              renderSpec: charts.GridlineRendererSpec(
                lineStyle: charts.LineStyleSpec(
                  color: charts.MaterialPalette.gray.shade300,
                ),
                labelStyle: charts.TextStyleSpec(
                  fontSize: 12,
                  color: charts.MaterialPalette.gray.shade300,
                ),
              ),
            ),
            domainAxis: charts.NumericAxisSpec(
              tickProviderSpec:
                  charts.BasicNumericTickProviderSpec(desiredTickCount: 10),
              renderSpec: charts.GridlineRendererSpec(
                lineStyle: charts.LineStyleSpec(
                  color: charts.MaterialPalette.gray.shade300,
                ),
                labelStyle: charts.TextStyleSpec(
                  fontSize: 12,
                  color: charts.MaterialPalette.gray.shade300,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


