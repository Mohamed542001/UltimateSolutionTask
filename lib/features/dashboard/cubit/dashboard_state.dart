part of 'dashboard_cubit.dart';

class DashboardState {}

class FeatureIdle extends DashboardState {}

class FeatureLoading extends DashboardState {}

class FeatureSuccess extends DashboardState {}
class CardHoverSuccess extends DashboardState {}
class SelectDateSuccess extends DashboardState {}

class FeatureError extends DashboardState {
  final NetworkExceptions networkExceptions;
  FeatureError({
    required this.networkExceptions,
  });
}
