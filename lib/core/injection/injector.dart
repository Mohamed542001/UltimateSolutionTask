import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultimate_solution_task/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:ultimate_solution_task/features/dashboard/data/dashboard_data_source/dashboard_data_source.dart';
import 'package:ultimate_solution_task/features/dashboard/data/repository/dashboard_repository.dart';
import 'package:ultimate_solution_task/features/main_screen/cubit/home_cubit.dart';
import 'package:ultimate_solution_task/features/main_screen/cubit/home_cubit.dart';
import '../network/dio_helper.dart';
import '../src/app_export.dart';

final getIt = GetIt.instance;

void initGetIt() {
  /// BLoC
  getIt.registerFactory<DashboardCubit>(() => DashboardCubit(getIt()));
  getIt.registerFactory<LocalizationBloc>(() => LocalizationBloc());
  getIt.registerFactory<HomeCubit>(() => HomeCubit());

  /// Data Sources
  getIt.registerLazySingleton<DashboardDataSource>(
      () => DashboardDataSource(getIt()));

  /// Repository
  getIt.registerLazySingleton<DashboardRepository>(
      () => DashboardRepository(getIt()));

  /// SharedPreferences
  getIt.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());

  /// Dio
  getIt.registerLazySingleton<BaseDioHelper>(() => DioHelper());
}
