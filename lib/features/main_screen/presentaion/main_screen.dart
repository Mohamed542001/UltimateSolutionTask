import 'package:ultimate_solution_task/core/common/widgets/build_appbar.dart';
import 'package:ultimate_solution_task/core/common/widgets/build_dashboard_menu.dart';
import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:ultimate_solution_task/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/feature_screen.dart';
import 'package:ultimate_solution_task/features/main_screen/cubit/home_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: screenWidth < 800
          ? const BuildDashboardMenu(
        isDrawer: true,
      )
          : null,
      body:  BlocBuilder<HomeCubit,HomeState>(
        builder: (context,state) {
          var cubit = HomeCubit.get(context);
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (screenWidth > 800) const BuildDashboardMenu(),
              const Expanded(
                child: CustomScrollView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    BuildAppbar(),
                    FeatureScreen(),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
