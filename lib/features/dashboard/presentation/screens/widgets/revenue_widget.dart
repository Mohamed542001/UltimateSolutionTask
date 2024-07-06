import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:ultimate_solution_task/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:ultimate_solution_task/features/dashboard/data/models/revenue_model.dart';

class RevenueWidget extends StatelessWidget {
  const RevenueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit,DashboardState>(
      builder: (context,state) {
        var cubit = DashboardCubit.get(context);
        return SfCartesianChart(
          // Set transparent background and border
          backgroundColor: Colors.transparent,
          plotAreaBorderWidth: 0, // Remove plot area border
          primaryXAxis: const CategoryAxis(
            majorGridLines: MajorGridLines(width: 0), // Remove vertical grid lines
            axisLine: AxisLine(width: 0), // Remove x-axis line
          ),
          primaryYAxis: const NumericAxis(
            isVisible: true,
            majorGridLines: MajorGridLines(width: 0), // Remove horizontal grid lines
            axisLine: AxisLine(width: 0), // Remove y-axis line
            majorTickLines: MajorTickLines(width: 0), // Remove y-axis tick lines
            minimum: 0, // Start from 0
            maximum: 800, // End at 800
            interval: 200, // Interval of 200
            labelFormat: '{value}', // Format labels as plain numbers
            title: AxisTitle(text: 'Net Revenue'),
          ),
          axes: const <ChartAxis>[
            NumericAxis(
              majorGridLines: MajorGridLines(width: 0), // Remove secondary y-axis grid lines
              axisLine: AxisLine(width: 0), // Remove secondary y-axis line
              majorTickLines: MajorTickLines(width: 0), // Remove secondary y-axis tick lines
              minimum: 0, // Start from 0
              maximum: 50, // End at 50
              interval: 10, // Interval of 10
              labelFormat: '{value}', // Format labels as plain numbers
              name: 'SecondaryYAxis',
              opposedPosition: true,
              title: AxisTitle(text: 'Number of Sales'),
            ),
          ],
          legend: const Legend(isVisible: true, position: LegendPosition.bottom),
          tooltipBehavior: TooltipBehavior(enable: true),
          selectionGesture: ActivationMode.singleTap,
          series: <CartesianSeries>[
            // Column series
            ColumnSeries<RevenueModel, String>(
              dataSource: cubit.getRevenueModel(),
              xValueMapper: (RevenueModel data, _) => data.x,
              yValueMapper: (RevenueModel data, _) => data.y1,
              name: 'Sales',
              yAxisName: 'SecondaryYAxis',
              width: 0.2, // Adjust column width
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.top,
                builder: (data, point, series, pointIndex, seriesIndex) {
                  return Container(
                    width: 40,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      data.y1.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  );
                },
              ),
              color: Colors.teal.withOpacity(0.2),
            ),
            // Area series
            AreaSeries<RevenueModel, String>(
              dataSource: cubit.getRevenueModel(),
              xValueMapper: (RevenueModel data, _) => data.x,
              yValueMapper: (RevenueModel data, _) => data.y2,
              name: 'Revenue',
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              color: Colors.pink.withOpacity(0.5),
              borderColor: Colors.pink,
              borderWidth: 2,
              enableTooltip: true,
            ),
          ],
        );
      }
    );
  }


}

