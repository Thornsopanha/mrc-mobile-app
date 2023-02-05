import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:mrc_mobile_app/providers/water_data_provider.dart';

class MrcBarChart extends StatelessWidget {
  const MrcBarChart({
    super.key,
    required this.data,
  });

  final List<WaterDataPoint> data;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      [
        Series<WaterDataPoint, String>(
          id: 'Water Level',
          colorFn: (_, __) => MaterialPalette.black,
          data: data,
          domainFn: (WaterDataPoint dataPoint, _) => dataPoint.time.toString(),
          measureFn: (WaterDataPoint dataPoint, _) => dataPoint.level,
        ),
      ],
      animate: true,
      defaultRenderer: BarRendererConfig(),
    );
  }
}
