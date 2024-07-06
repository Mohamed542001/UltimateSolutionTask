import 'package:dio/dio.dart';

import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/end_points.dart';

class DashboardDataSource {
  final BaseDioHelper baseDioHelper;

  DashboardDataSource(this.baseDioHelper);

  Future getUser({required int id}) async {
    final Response response = await baseDioHelper.get(
      endPoint: '${EndPoints.users}$id',
    );
    return response.data;
  }
}
