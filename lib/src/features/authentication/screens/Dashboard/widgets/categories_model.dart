

import 'package:flutter/material.dart';

class DashboardCategoriesModel{
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategoriesModel(this.title,this.heading,this.subHeading,this.onPress);

  static List<DashboardCategoriesModel> list=[
    DashboardCategoriesModel("Accuracy", "Score", "87 ", null),
    DashboardCategoriesModel("Percentile", "Score", "87 ", null),
    DashboardCategoriesModel("All Average", "Score", "87 ", null),
    DashboardCategoriesModel("Current Avg", "Score", "87 ", null),
  ];

}