import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:ultimate_solution_task/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/build_card_view.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/linear_progress_indicator_view.dart';

class SegmentedProgressBar extends StatefulWidget {
  const SegmentedProgressBar(
      {super.key,
      required this.progressValue,
      required this.size,
      required this.progressBarColor});
  final double progressValue;
  final double size;
  final Color progressBarColor;

  @override
  State<SegmentedProgressBar> createState() => _SegmentedProgressBarState();
}

class _SegmentedProgressBarState extends State<SegmentedProgressBar> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit,DashboardState>(
      builder: (context,state) {
        var cubit = DashboardCubit.get(context);
        return BuildCardView(
          defaultSize: 120,
          tablesSize: 200,
          desktopSize: 80,
          verticalPadding: 0,
          iconButton: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  final RenderBox button = context.findRenderObject() as RenderBox;
                  final RenderBox overlay =
                  Overlay.of(context).context.findRenderObject() as RenderBox;
                  final Offset position =
                  button.localToGlobal(Offset.zero, ancestor: overlay);
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      position.dx - 90,
                      position.dy + button.size.height,
                      position.dx + button.size.width,
                      position.dy + button.size.height,
                    ),
                    items: [
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text('Item 1'),
                      ),
                      const PopupMenuItem<int>(
                        value: 2,
                        child: Text('Item 2'),
                      ),
                      const PopupMenuItem<int>(
                        value: 3,
                        child: Text('Item 3'),
                      ),
                    ],
                  ).then((value) {
                    if (value != null) {
                      // Handle item selection here
                      print('Selected item: $value');
                      // You can add any action you want to perform here
                    }
                  });
                },
              );
            },
          ),
          view: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    cubit.onSegmentationHover();
                  },
                  child: SizedBox(
                    width: widget.size,
                    height: widget.size,
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          showTicks: false,
                          showLabels: false,
                          endAngle: 55,
                          radiusFactor: 0.85,
                          axisLineStyle: const AxisLineStyle(
                              thickness: 30,
                              dashArray: <double>[8, 3],
                              color: AppColors.cA4ACAD),
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              angle: 90,
                              positionFactor: 0.25,
                              widget: Text(
                                '${widget.progressValue.toStringAsFixed(0)}%',
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Times',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                          pointers: <GaugePointer>[
                            RangePointer(
                              value: widget.progressValue,
                              enableAnimation: true,
                              color: cubit.isSegmentationHover==true?AppColors.primary.withOpacity(0.6):AppColors.primary,
                              // animationType: AnimationType.linear,
                              animationDuration: 2000,
                              width: 30,
                              dashArray: const <double>[8, 3],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.r),
                  child:  const Column(
                    children: [
                      LinearProgressIndicatorView(title: 'Brooklyn, New York',value: 0.72,number: 72,),
                      LinearProgressIndicatorView(title: 'The Castro, San Francisco',value: 0.39,number: 39,),
                      LinearProgressIndicatorView(title: 'Kovan, Singapore',value: 0.61,number: 61,),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
