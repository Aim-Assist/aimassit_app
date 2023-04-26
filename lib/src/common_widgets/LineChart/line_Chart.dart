import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'Line_model.dart';

class LineChartWidget extends StatefulWidget {
  final List userData;
  const LineChartWidget({super.key, required this.userData});

  // final List<charts.Series<LineModel, int>> seriesList;

  // const LineChartWidget(this.seriesList, {this.animate = true});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  final List<LineModel> data = [LineModel(0,0)];

  _createSampleData(userData) async {
    for (var i = 0; i < userData.length; i++) {
      setState(() {
        data.add(LineModel(i+1,userData[i]));
      });
    }

    return data;
  }

  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _createSampleData(widget.userData);
    });
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
            [
              charts.Series<LineModel, int>(
                  id: 'Accuracy',
                  colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                  domainFn: (LineModel lineModel, _) => lineModel.session,
                  measureFn: (LineModel lineModel, _) => lineModel.accuracy,
                  data: data),
            ],
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
          ),
        ),
      ),
    );
  }
}
