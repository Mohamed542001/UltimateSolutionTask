import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:ultimate_solution_task/features/dashboard/data/dashboard_data_source/dashboard_data_source.dart';
import 'package:ultimate_solution_task/features/dashboard/data/models/user.dart';

class DashboardRepository {
  final DashboardDataSource _dashboardDataSource;

  DashboardRepository(this._dashboardDataSource);

  Future<NetworkService<User>> getUser(int id) async {
    try {
      return NetworkService.succeed(
        User.fromJson(await _dashboardDataSource.getUser(id: id)),
      );
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }
}
