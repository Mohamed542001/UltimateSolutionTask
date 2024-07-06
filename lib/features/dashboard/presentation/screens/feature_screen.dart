import 'package:responsive_framework/responsive_framework.dart';
import 'package:ultimate_solution_task/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/build_bottom_tables.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/build_calendar_view.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/dashboard_table.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/hover.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/map_and_table_view.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/segmentation_and_revenue_view.dart';
import '../../../../core/src/app_export.dart';

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({super.key});

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (_)=>getIt<DashboardCubit>(),
      child: SliverFillRemaining(
        hasScrollBody: false,
        // child: DashboardBloc.get(context)
        //     .screens[context.watch<DashboardBloc>().selectedIndex],
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Dashboard",
                          style: AppTextStyles.textStyle(
                              color: AppColors.blackOpacity,
                              size: 16,
                              weight: FontWeight.w700),
                        ),
                      ),
                      if(screenWidth>1000)SizedBox(width:300,child: BuildCalendarView())                    ],
                  ),
                  if(screenWidth<1000)BuildCalendarView(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(
                        6,
                            (i) => HoverCard(
                          width:
                          MediaQuery.of(context).size.width,
                        )),
                  ),

                  SizedBox(
                    height: screenWidth < 1100 ?830 : 430,
                    width: double.infinity,
                    child: const SegmentationAndRevenueView(),
                  ),
                  SizedBox(
                    height: screenWidth < 1420 ? 830 : 470,
                    width: double.infinity,
                    child: const MapAndTableView(),
                  ),
                  BuildBottomTables(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
