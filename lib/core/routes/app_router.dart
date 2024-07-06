import 'package:ultimate_solution_task/features/dashboard/presentation/screens/feature_screen.dart';
import 'package:ultimate_solution_task/features/main_screen/cubit/home_cubit.dart';
import 'package:ultimate_solution_task/features/main_screen/presentaion/main_screen.dart';

import '../common/widgets/no_route.dart';
import '../src/app_export.dart';

part 'app_routes.dart';

class AppRouter {
  static Route? generateRoutes(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case AppRoutes.initScreen:
            return BlocProvider(
                create: (_)=>getIt<HomeCubit>(),
                child: const MainScreen());
          default:
            return NoRouteScreen(routeName: settings.name!);
        }
      },
    );
  }
}
