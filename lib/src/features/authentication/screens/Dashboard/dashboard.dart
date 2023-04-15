import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:loginsys/src/Charts/LineChart/line_Chart.dart';
import 'package:loginsys/src/cardSlider/cardslider.dart';
import 'package:loginsys/src/common_widgets/form/form_header_widget.dart';
import 'package:loginsys/src/constants/colors.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/sizes.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/widgets/Scrollable.dart';
import 'package:loginsys/src/features/authentication/screens/welcome/Signup/widgets/signup_form_widget.dart';
import 'package:loginsys/src/Charts/BarChart/bar_chart.dart';
// import 'package:loginsys/src/Charts/BarChart/bar_chart.dart';



class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: IconButton(onPressed: (){},icon: const Image(image: AssetImage(tUserprofileImage))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(tDashboardTitle, style: Theme.of(context).textTheme.bodyMedium),
              Text(tDashboardHeading, style: Theme.of(context).textTheme.headlineLarge),

              

              const DashboardScrollable(),
              
              Barchart(),
              
              LineChartWidget(),




            ]
          )
        ),
        ),
        
    );
  }
}
