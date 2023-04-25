import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SimpleLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      [
        charts.Series<int, int>(
          id: 'Line Chart',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (data, _) => data,
          measureFn: (data, _) => data,
          data: [
            10,
            20,
            30,
            40,
            50,
            60,
            70,
            80,
            90,
            100,
          ],
        ),
      ],
      animate: true,
      defaultRenderer: charts.LineRendererConfig(includePoints: true),
      primaryMeasureAxis: charts.NumericAxisSpec(
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
          zeroBound: false,
          dataIsInWholeNumbers: true,
          desiredTickCount: 11,
        ),
      ),
      domainAxis: charts.NumericAxisSpec(
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
          zeroBound: false,
          dataIsInWholeNumbers: true,
          desiredTickCount: 10,
        ),
      ),
    );
  }
}
