// import 'package:flutter/material.dart';
// // ignore: depend_on_referenced_packages
// import 'package:charts_flutter/flutter.dart' as charts;

// import 'Bar_model.dart';
// // import 'dart:ffi';

// class BarChart extends StatelessWidget {
//   const BarChart({Key? key}) : super(key:key);

//   static List<charts.Series<Barmodel, String>> _createSampleData(){
//     final data = [
//       Barmodel("1",5),
//       Barmodel("2",4),
//       Barmodel("3",4),
//       Barmodel("4",4),
//       Barmodel("5",4),
//       Barmodel("6",4),
//       Barmodel("7",4),
//       Barmodel("8",4),
//       Barmodel("9",5),
//       Barmodel("10",5),

//     ];
//     return[
//       charts.Series<Barmodel, String>(
//         data: data,
//         id: 'Currewnt Session',
//         colorFn: (_, __)=> charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (Barmodel barModel1, _) => barModel1.bullet,
//         measureFn: (Barmodel barModel1, _) => barModel1.score,
//         )
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         // width: double.infinity,
//         height: 300,
//         child: charts.BarChart(
//           _createSampleData(),

//         ),
//       );

//   }
// }

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'Bar_model.dart';

// class BarChart extends StatelessWidget {
//   const BarChart({Key? key}) : super(key:key);

//   static List<charts.Series<Barmodel, String>> _createSampleData(){
//     final data = [
//       Barmodel("1",5),
//       Barmodel("2",4),
//       Barmodel("3",4),
//       Barmodel("4",4),
//       Barmodel("5",4),
//       Barmodel("6",4),
//       Barmodel("7",4),
//       Barmodel("8",4),
//       Barmodel("9",5),
//       Barmodel("10",5),
//     ];
//     return[
//       charts.Series<Barmodel, String>(
//         data: data,
//         id: 'Current Session',
//         colorFn: (_, __)=> charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (Barmodel barModel1, _) => barModel1.bullet,
//         measureFn: (Barmodel barModel1, _) => barModel1.score,
//       )
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       elevation: 4,
//       margin: const EdgeInsets.all(16),
//       child: Container(
//         height: 300,
//         padding: const EdgeInsets.all(16),
//         child: charts.BarChart(
//           _createSampleData(),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:intl/intl_browser.dart';

// import 'Bar_model.dart';

// class BarChart extends StatelessWidget {
//   const BarChart({Key? key}) : super(key: key);

//   static List<charts.Series<Barmodel, String>> _createSampleData() {
//     final data = [      Barmodel("1", 5),      Barmodel("2", 4),      Barmodel("3", 4),      Barmodel("4", 4),      Barmodel("5", 4),      Barmodel("6", 4),      Barmodel("7", 4),      Barmodel("8", 4),      Barmodel("9", 5),      Barmodel("10", 5),    ];
//     return [      charts.Series<Barmodel, String>(        data: data,        id: 'Current Session',        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,        domainFn: (Barmodel barModel1, _) => barModel1.bullet,        measureFn: (Barmodel barModel1, _) => barModel1.score,      )    ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: charts.BarChart(
//         _createSampleData(),
//         animate: true,
//         barRendererDecorator: charts.BarLabelDecorator<String>(
//           labelAnchor: charts.BarLabelAnchor.end,
//           labelPosition: charts.BarLabelPosition.auto,
//           labelPadding: const EdgeInsets.symmetric(horizontal: 2.0),
//           labelMargin: const EdgeInsets.only(top: 5.0),
//           outsideLabelStyleSpec: charts.TextStyleSpec(
//             fontSize: 12,
//             color: charts.MaterialPalette.gray.shade300,
//           ),
//         ),
//         primaryMeasureAxis: charts.NumericAxisSpec(
//           renderSpec: charts.GridlineRendererSpec(
//             lineStyle: charts.LineStyleSpec(
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//             labelStyle: charts.TextStyleSpec(
//               fontSize: 12,
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//           ),
//           tickFormatterSpec: charts.BasicNumericTickFormatterSpec.fromNumberFormat(
//             charts.NumberFormat.compactSimpleCurrency(decimalDigits: 0),
//           ),
//         ),
//         domainAxis: charts.OrdinalAxisSpec(
//           renderSpec: charts.SmallTickRendererSpec(
//             lineStyle: charts.LineStyleSpec(
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//             labelStyle: charts.TextStyleSpec(
//               fontSize: 12,
//               // color: charts.MaterialPalette.gray.shade300,
//               color: charts.ColorUtil.fromDartColor(Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:intl/intl.dart';

// import 'Bar_model.dart';

// class BarChart extends StatelessWidget {
//   const BarChart({Key? key}) : super(key: key);

//   static List<charts.Series<Barmodel, String>> _createSampleData() {
//     final data = [
//       Barmodel("1", 5),
//       Barmodel("2", 4),
//       Barmodel("3", 4),
//       Barmodel("4", 4),
//       Barmodel("5", 4),
//       Barmodel("6", 4),
//       Barmodel("7", 4),
//       Barmodel("8", 4),
//       Barmodel("9", 5),
//       Barmodel("10", 5),
//     ];
//     return [
//       charts.Series<Barmodel, String>(
//         data: data,
//         id: 'Current Session',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (Barmodel barModel1, _) => barModel1.bullet,
//         measureFn: (Barmodel barModel1, _) => barModel1.score,
//       )
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: charts.BarChart(
//         _createSampleData(),
//         animate: true,
//         // barRendererDecorator: charts.BarLabelDecorator<String>(
//         //   labelAnchor: charts.BarLabelAnchor.end,
//         //   labelPosition: charts.BarLabelPosition.auto,
//         //   labelPadding: const EdgeInsets.symmetric(horizontal: 2.0),
//         //   labelPositionPadding: const EdgeInsets.only(top: 5.0),
//         //   outsideLabelStyleSpec: charts.TextStyleSpec(
//         //     fontSize: 12,
//         //     color: charts.MaterialPalette.gray.shade300,
//         barRendererDecorator: charts.BarLabelDecorator<String>(
//           labelAnchor: charts.BarLabelAnchor.end,
//           labelPosition: charts.BarLabelPosition.auto,
//           // insideLabelPadding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
//           outsideLabelStyleSpec: charts.TextStyleSpec(
//             fontSize: 12,
//             color: charts.MaterialPalette.gray.shade300,
//           ),
//         ),
// //     barRendererDecorator: charts.BarLabelDecorator<String>(
// //   labelAnchor: charts.BarLabelAnchor.end,
// //   labelPosition: charts.BarLabelPosition.auto,
// //   labelPadding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
// //   outsideLabelStyleSpec: charts.TextStyleSpec(
// //     fontSize: 12,
// //     color: charts.MaterialPalette.gray.shade300,
// //   ),
// // ),

//         // primaryMeasureAxis: charts.NumericAxisSpec(
//         //   renderSpec: charts.GridlineRendererSpec(
//         //     lineStyle: charts.LineStyleSpec(
//         //       color: charts.MaterialPalette.gray.shade300,
//         //     ),
//         //     labelStyle: charts.TextStyleSpec(
//         //       fontSize: 12,
//         //       color: charts.MaterialPalette.gray.shade300,
//         //     ),
//         //   ),
//         //   tickFormatter: (value) {
//         //     return NumberFormat.compactSimpleCurrency(decimalDigits: 0).format(value);
//         //   },
//         // ),
//         primaryMeasureAxis: charts.NumericAxisSpec(
//           renderSpec: charts.GridlineRendererSpec(
//             lineStyle: charts.LineStyleSpec(
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//             labelStyle: charts.TextStyleSpec(
//               fontSize: 12,
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//           ),
//           tickFormatterSpec:
//               charts.BasicNumericTickFormatterSpec.fromNumberFormat(
//             NumberFormat.compactCurrency(decimalDigits: 0),
//           ),
//         ),

//         domainAxis: charts.OrdinalAxisSpec(
//           renderSpec: charts.SmallTickRendererSpec(
//             lineStyle: charts.LineStyleSpec(
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//             labelStyle: charts.TextStyleSpec(
//               fontSize: 12,
//               color: charts.ColorUtil.fromDartColor(Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// import 'Bar_model.dart';

// class BarChart extends StatelessWidget {
//   const BarChart({Key? key}) : super(key: key);

//   static List<charts.Series<Barmodel, String>> _createSampleData() {
//     final data = [
//       Barmodel("1", 5),
//       Barmodel("2", 4),
//       Barmodel("3", 4),
//       Barmodel("4", 4),
//       Barmodel("5", 4),
//       Barmodel("6", 4),
//       Barmodel("7", 4),
//       Barmodel("8", 4),
//       Barmodel("9", 5),
//       Barmodel("10", 5),
//     ];
//     return [
//       charts.Series<Barmodel, String>(
//         data: data,
//         id: 'Current Session',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (Barmodel barModel1, _) => barModel1.bullet,
//         measureFn: (Barmodel barModel1, _) => barModel1.score,
//       )
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: charts.BarChart(
//         _createSampleData(),
//         animate: true,
//         barRendererDecorator: charts.BarLabelDecorator<String>(
//           labelAnchor: charts.BarLabelAnchor.end,
//           labelPosition: charts.BarLabelPosition.auto,
//           // labelPadding: const EdgeInsets.symmetric(horizontal: 2.0),
//           // labelPositionPadding: const EdgeInsets.only(top: 5.0),
//           outsideLabelStyleSpec: charts.TextStyleSpec(
//             fontSize: 12,
//             color: charts.MaterialPalette.gray.shade300,
//           ),
//         ),
//         primaryMeasureAxis: charts.NumericAxisSpec(
//           renderSpec: charts.GridlineRendererSpec(
//             lineStyle: charts.LineStyleSpec(
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//             labelStyle: charts.TextStyleSpec(
//               fontSize: 12,
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//           ),
//           tickProviderSpec:
//               charts.BasicNumericTickProviderSpec(desiredTickCount: 5),
//         ),
//         domainAxis: charts.OrdinalAxisSpec(
//           renderSpec: charts.SmallTickRendererSpec(
//             lineStyle: charts.LineStyleSpec(
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//             labelStyle: charts.TextStyleSpec(
//               fontSize: 12,
//               color: charts.ColorUtil.fromDartColor(Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/widgets.dart';

// import 'Bar_model.dart';

// class Barchart extends StatelessWidget {
//   const Barchart({Key? key}) : super(key: key);

//   static List<charts.Series<Barmodel, String>> _createSampleData() {
//     final data = [
//       Barmodel("1", 5),
//       Barmodel("2", 4),
//       Barmodel("3", 4),
//       Barmodel("4", 4),
//       Barmodel("5", 4),
//       Barmodel("6", 4),
//       Barmodel("7", 4),
//       Barmodel("8", 4),
//       Barmodel("9", 5),
//       Barmodel("10", 5),
//     ];
//     return [
//       charts.Series<Barmodel, String>(
//         data: data,
//         id: 'Current Session',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (Barmodel barModel1, _) => barModel1.bullet,
//         measureFn: (Barmodel barModel1, _) => barModel1.score,
//       )
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: SizedBox(
//         height: 300,
//         child: charts.BarChart(
//           _createSampleData(),
//           animate: true,
//           barRendererDecorator: charts.BarLabelDecorator<String>(
//             labelAnchor: charts.BarLabelAnchor.end,
//             labelPosition: charts.BarLabelPosition.auto,
//             // labelPadding: const EdgeInsets.symmetric(horizontal: 2.0),
//             // outsideLabelPadding: const EdgeInsets.only(top: 5.0),

//             outsideLabelStyleSpec: charts.TextStyleSpec(
//               fontSize: 12,
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//           ),
//           primaryMeasureAxis: charts.NumericAxisSpec(
//             renderSpec: charts.GridlineRendererSpec(
//               lineStyle: charts.LineStyleSpec(
//                 color: charts.MaterialPalette.gray.shade300,
//               ),
//               labelStyle: charts.TextStyleSpec(
//                 fontSize: 12,
//                 color: charts.MaterialPalette.gray.shade300,
//               ),
//             ),
//             tickProviderSpec:
//                 charts.BasicNumericTickProviderSpec(desiredTickCount: 5),
//             // set maximum value to 5 and minimum value to 0
//             // and add 1 unit padding to both sides
//             viewport: charts.NumericExtents(0, 6),
//           ),
//           domainAxis: charts.OrdinalAxisSpec(
//             renderSpec: charts.SmallTickRendererSpec(
//               lineStyle: charts.LineStyleSpec(
//                 color: charts.MaterialPalette.gray.shade300,
//               ),
//               labelStyle: charts.TextStyleSpec(
//                 fontSize: 12,
//                 color: charts.ColorUtil.fromDartColor(Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );

//   }
// }

// import 'package:flutter/material.dart';
// // ignore: depend_on_referenced_packages
// import 'package:charts_flutter/flutter.dart' as charts;

// import 'Bar_model.dart';
// // import 'dart:ffi';

// class BarChart extends StatelessWidget {
//   const BarChart({Key? key}) : super(key:key);

//   static List<charts.Series<Barmodel, String>> _createSampleData(){
//     final data = [
//       Barmodel("1",5),
//       Barmodel("2",4),
//       Barmodel("3",4),
//       Barmodel("4",4),
//       Barmodel("5",4),
//       Barmodel("6",4),
//       Barmodel("7",4),
//       Barmodel("8",4),
//       Barmodel("9",5),
//       Barmodel("10",5),

//     ];
//     return[
//       charts.Series<Barmodel, String>(
//         data: data,
//         id: 'Currewnt Session',
//         colorFn: (_, __)=> charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (Barmodel barModel1, _) => barModel1.bullet,
//         measureFn: (Barmodel barModel1, _) => barModel1.score,
//         )
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         // width: double.infinity,
//         height: 300,
//         child: charts.BarChart(
//           _createSampleData(),

//         ),
//       );

//   }
// }

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'Bar_model.dart';

// class BarChart extends StatelessWidget {
//   const BarChart({Key? key}) : super(key:key);

//   static List<charts.Series<Barmodel, String>> _createSampleData(){
//     final data = [
//       Barmodel("1",5),
//       Barmodel("2",4),
//       Barmodel("3",4),
//       Barmodel("4",4),
//       Barmodel("5",4),
//       Barmodel("6",4),
//       Barmodel("7",4),
//       Barmodel("8",4),
//       Barmodel("9",5),
//       Barmodel("10",5),
//     ];
//     return[
//       charts.Series<Barmodel, String>(
//         data: data,
//         id: 'Current Session',
//         colorFn: (_, __)=> charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (Barmodel barModel1, _) => barModel1.bullet,
//         measureFn: (Barmodel barModel1, _) => barModel1.score,
//       )
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       elevation: 4,
//       margin: const EdgeInsets.all(16),
//       child: Container(
//         height: 300,
//         padding: const EdgeInsets.all(16),
//         child: charts.BarChart(
//           _createSampleData(),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:intl/intl_browser.dart';

// import 'Bar_model.dart';

// class BarChart extends StatelessWidget {
//   const BarChart({Key? key}) : super(key: key);

//   static List<charts.Series<Barmodel, String>> _createSampleData() {
//     final data = [      Barmodel("1", 5),      Barmodel("2", 4),      Barmodel("3", 4),      Barmodel("4", 4),      Barmodel("5", 4),      Barmodel("6", 4),      Barmodel("7", 4),      Barmodel("8", 4),      Barmodel("9", 5),      Barmodel("10", 5),    ];
//     return [      charts.Series<Barmodel, String>(        data: data,        id: 'Current Session',        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,        domainFn: (Barmodel barModel1, _) => barModel1.bullet,        measureFn: (Barmodel barModel1, _) => barModel1.score,      )    ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: charts.BarChart(
//         _createSampleData(),
//         animate: true,
//         barRendererDecorator: charts.BarLabelDecorator<String>(
//           labelAnchor: charts.BarLabelAnchor.end,
//           labelPosition: charts.BarLabelPosition.auto,
//           labelPadding: const EdgeInsets.symmetric(horizontal: 2.0),
//           labelMargin: const EdgeInsets.only(top: 5.0),
//           outsideLabelStyleSpec: charts.TextStyleSpec(
//             fontSize: 12,
//             color: charts.MaterialPalette.gray.shade300,
//           ),
//         ),
//         primaryMeasureAxis: charts.NumericAxisSpec(
//           renderSpec: charts.GridlineRendererSpec(
//             lineStyle: charts.LineStyleSpec(
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//             labelStyle: charts.TextStyleSpec(
//               fontSize: 12,
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//           ),
//           tickFormatterSpec: charts.BasicNumericTickFormatterSpec.fromNumberFormat(
//             charts.NumberFormat.compactSimpleCurrency(decimalDigits: 0),
//           ),
//         ),
//         domainAxis: charts.OrdinalAxisSpec(
//           renderSpec: charts.SmallTickRendererSpec(
//             lineStyle: charts.LineStyleSpec(
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//             labelStyle: charts.TextStyleSpec(
//               fontSize: 12,
//               // color: charts.MaterialPalette.gray.shade300,
//               color: charts.ColorUtil.fromDartColor(Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:intl/intl.dart';

// import 'Bar_model.dart';

// class BarChart extends StatelessWidget {
//   const BarChart({Key? key}) : super(key: key);

//   static List<charts.Series<Barmodel, String>> _createSampleData() {
//     final data = [
//       Barmodel("1", 5),
//       Barmodel("2", 4),
//       Barmodel("3", 4),
//       Barmodel("4", 4),
//       Barmodel("5", 4),
//       Barmodel("6", 4),
//       Barmodel("7", 4),
//       Barmodel("8", 4),
//       Barmodel("9", 5),
//       Barmodel("10", 5),
//     ];
//     return [
//       charts.Series<Barmodel, String>(
//         data: data,
//         id: 'Current Session',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (Barmodel barModel1, _) => barModel1.bullet,
//         measureFn: (Barmodel barModel1, _) => barModel1.score,
//       )
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: charts.BarChart(
//         _createSampleData(),
//         animate: true,
//         // barRendererDecorator: charts.BarLabelDecorator<String>(
//         //   labelAnchor: charts.BarLabelAnchor.end,
//         //   labelPosition: charts.BarLabelPosition.auto,
//         //   labelPadding: const EdgeInsets.symmetric(horizontal: 2.0),
//         //   labelPositionPadding: const EdgeInsets.only(top: 5.0),
//         //   outsideLabelStyleSpec: charts.TextStyleSpec(
//         //     fontSize: 12,
//         //     color: charts.MaterialPalette.gray.shade300,
//         barRendererDecorator: charts.BarLabelDecorator<String>(
//           labelAnchor: charts.BarLabelAnchor.end,
//           labelPosition: charts.BarLabelPosition.auto,
//           // insideLabelPadding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
//           outsideLabelStyleSpec: charts.TextStyleSpec(
//             fontSize: 12,
//             color: charts.MaterialPalette.gray.shade300,
//           ),
//         ),
// //     barRendererDecorator: charts.BarLabelDecorator<String>(
// //   labelAnchor: charts.BarLabelAnchor.end,
// //   labelPosition: charts.BarLabelPosition.auto,
// //   labelPadding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
// //   outsideLabelStyleSpec: charts.TextStyleSpec(
// //     fontSize: 12,
// //     color: charts.MaterialPalette.gray.shade300,
// //   ),
// // ),

//         // primaryMeasureAxis: charts.NumericAxisSpec(
//         //   renderSpec: charts.GridlineRendererSpec(
//         //     lineStyle: charts.LineStyleSpec(
//         //       color: charts.MaterialPalette.gray.shade300,
//         //     ),
//         //     labelStyle: charts.TextStyleSpec(
//         //       fontSize: 12,
//         //       color: charts.MaterialPalette.gray.shade300,
//         //     ),
//         //   ),
//         //   tickFormatter: (value) {
//         //     return NumberFormat.compactSimpleCurrency(decimalDigits: 0).format(value);
//         //   },
//         // ),
//         primaryMeasureAxis: charts.NumericAxisSpec(
//           renderSpec: charts.GridlineRendererSpec(
//             lineStyle: charts.LineStyleSpec(
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//             labelStyle: charts.TextStyleSpec(
//               fontSize: 12,
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//           ),
//           tickFormatterSpec:
//               charts.BasicNumericTickFormatterSpec.fromNumberFormat(
//             NumberFormat.compactCurrency(decimalDigits: 0),
//           ),
//         ),

//         domainAxis: charts.OrdinalAxisSpec(
//           renderSpec: charts.SmallTickRendererSpec(
//             lineStyle: charts.LineStyleSpec(
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//             labelStyle: charts.TextStyleSpec(
//               fontSize: 12,
//               color: charts.ColorUtil.fromDartColor(Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// import 'Bar_model.dart';

// class BarChart extends StatelessWidget {
//   const BarChart({Key? key}) : super(key: key);

//   static List<charts.Series<Barmodel, String>> _createSampleData() {
//     final data = [
//       Barmodel("1", 5),
//       Barmodel("2", 4),
//       Barmodel("3", 4),
//       Barmodel("4", 4),
//       Barmodel("5", 4),
//       Barmodel("6", 4),
//       Barmodel("7", 4),
//       Barmodel("8", 4),
//       Barmodel("9", 5),
//       Barmodel("10", 5),
//     ];
//     return [
//       charts.Series<Barmodel, String>(
//         data: data,
//         id: 'Current Session',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (Barmodel barModel1, _) => barModel1.bullet,
//         measureFn: (Barmodel barModel1, _) => barModel1.score,
//       )
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: charts.BarChart(
//         _createSampleData(),
//         animate: true,
//         barRendererDecorator: charts.BarLabelDecorator<String>(
//           labelAnchor: charts.BarLabelAnchor.end,
//           labelPosition: charts.BarLabelPosition.auto,
//           // labelPadding: const EdgeInsets.symmetric(horizontal: 2.0),
//           // labelPositionPadding: const EdgeInsets.only(top: 5.0),
//           outsideLabelStyleSpec: charts.TextStyleSpec(
//             fontSize: 12,
//             color: charts.MaterialPalette.gray.shade300,
//           ),
//         ),
//         primaryMeasureAxis: charts.NumericAxisSpec(
//           renderSpec: charts.GridlineRendererSpec(
//             lineStyle: charts.LineStyleSpec(
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//             labelStyle: charts.TextStyleSpec(
//               fontSize: 12,
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//           ),
//           tickProviderSpec:
//               charts.BasicNumericTickProviderSpec(desiredTickCount: 5),
//         ),
//         domainAxis: charts.OrdinalAxisSpec(
//           renderSpec: charts.SmallTickRendererSpec(
//             lineStyle: charts.LineStyleSpec(
//               color: charts.MaterialPalette.gray.shade300,
//             ),
//             labelStyle: charts.TextStyleSpec(
//               fontSize: 12,
//               color: charts.ColorUtil.fromDartColor(Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'Bar_model.dart';

class Barchart extends StatefulWidget {
  final List userData;
  const Barchart({Key? key, required this.userData}) : super(key: key);

  @override
  State<Barchart> createState() => _BarchartState();
}

class _BarchartState extends State<Barchart> {
  final List<Barmodel> data = [];

  _createSampleData(userData) async {
    for (var i = 0; i < userData.length; i++) {
      setState(() {
        data.add(Barmodel("${i + 1}", userData[i]));
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
      child: SizedBox(
        height: 300,
        child: charts.BarChart(
          [
            charts.Series<Barmodel, String>(
              data: data,
              id: 'Current Session',
              colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
              domainFn: (Barmodel barModel1, _) => barModel1.bullet,
              measureFn: (Barmodel barModel1, _) => barModel1.score,
            )
          ],
          animate: true,
          barRendererDecorator: charts.BarLabelDecorator<String>(
            labelAnchor: charts.BarLabelAnchor.end,
            labelPosition: charts.BarLabelPosition.auto,
            outsideLabelStyleSpec: charts.TextStyleSpec(
              fontSize: 12,
              color: charts.MaterialPalette.gray.shade300,
            ),
          ),
          primaryMeasureAxis: charts.NumericAxisSpec(
            renderSpec: charts.GridlineRendererSpec(
              lineStyle: charts.LineStyleSpec(
                color: charts.MaterialPalette.gray.shade300,
              ),
              labelStyle: charts.TextStyleSpec(
                fontSize: 12,
                color: charts.MaterialPalette.gray.shade300,
              ),
            ),
            tickProviderSpec:
                charts.BasicNumericTickProviderSpec(desiredTickCount: 5),
            // set maximum value to 5 and minimum value to 0
            // and add 1 unit padding to both sides
            viewport: charts.NumericExtents(0, 6),
          ),
          domainAxis: charts.OrdinalAxisSpec(
            renderSpec: charts.SmallTickRendererSpec(
              lineStyle: charts.LineStyleSpec(
                color: charts.MaterialPalette.gray.shade300,
              ),
              labelStyle: charts.TextStyleSpec(
                fontSize: 12,
                color: charts.ColorUtil.fromDartColor(Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
