import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// ignore: must_be_immutable
class WaterLevelHistory extends StatelessWidget {
  List<Map<String, dynamic>> waterLevelData = [
    {'date': '2022-01-01', 'level': 120},
    {'date': '2022-01-02', 'level': 125},
    {'date': '2022-01-03', 'level': 130},
    {'date': '2022-01-04', 'level': 140},
    {'date': '2022-01-05', 'level': 135},
    {'date': '2022-01-06', 'level': 145},
    {'date': '2022-01-07', 'level': 150},
    {'date': '2022-01-08', 'level': 160},
    {'date': '2022-01-09', 'level': 155},
    {'date': '2022-01-10', 'level': 145},
  ];

  var data;

  WaterLevelHistory({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: charts.LineChart(
        [
          // charts.Series<WaterLevelData, DateTime>(
          //   id: 'WaterLevel',
          //   data: data,
          //   domainFn: (WaterLevelData waterLevelData, _) => waterLevelData.date,
          //   measureFn: (WaterLevelData waterLevelData, _) => waterLevelData.level,
          //   colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          // ),
        ],
        animate: false,
        primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: charts.GridlineRendererSpec(
            labelStyle: const charts.TextStyleSpec(
              fontSize: 14,
              color: charts.MaterialPalette.black,
            ),
            lineStyle: charts.LineStyleSpec(
              color: charts.MaterialPalette.gray.shade300,
            ),
          ),
        ),
        domainAxis: charts.DateTimeAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelStyle: const charts.TextStyleSpec(
              fontSize: 14,
              color: charts.MaterialPalette.black,
            ),
            lineStyle: charts.LineStyleSpec(
              color: charts.MaterialPalette.gray.shade300,
            ),
          ),
        ),
      ),
    );
  }
}

class WaterLevelData {
  final DateTime date;
  final double level;

  WaterLevelData(this.date, this.level);
}
