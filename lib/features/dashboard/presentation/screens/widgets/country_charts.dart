import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:ultimate_solution_task/features/dashboard/data/models/chart_data.dart';

class CountryCharts extends StatelessWidget {
  const CountryCharts({super.key});

  List<BarSeries<ChartData, String>> _getBarSeries() {
    final List<ChartData> chartData = [
      ChartData('UK', 15),
      ChartData('China', 25),
      ChartData('USA', 35),
      ChartData('Germany', 45),
      ChartData('India', 55),
    ];

    return <BarSeries<ChartData, String>>[
      BarSeries<ChartData, String>(
        dataSource: chartData,
        xValueMapper: (ChartData data, _) => data.country,
        yValueMapper: (ChartData data, _) => data.sales1,
        name: 'Progress',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Provide a fixed height
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SfCartesianChart(
          isTransposed: false,
          series: _getBarSeries(),
          plotAreaBorderWidth: 0,
          borderColor: Colors.transparent,
          backgroundColor: Colors.transparent,

          primaryXAxis: const CategoryAxis(
            axisLine: AxisLine(width: 0),
            majorGridLines: MajorGridLines(width: 0),
            majorTickLines: MajorTickLines(size: 0),
          ),
          primaryYAxis: const NumericAxis(
            axisLine: AxisLine(width: 0),
            labelStyle: TextStyle(
              fontSize: 8
            ),
            maximumLabelWidth: 20,
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            majorGridLines: MajorGridLines(width: 0),
            majorTickLines: MajorTickLines(size: 0),
            maximum: 100,
            interval: 20,
            labelFormat: '{value}%',
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
        ),
      ),
    );
  }
}
