part of 'home_cubit.dart';

class HomeState {}

class HomeIdle extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {}
class CardHoverSuccess extends HomeState {}
class SelectListTileSuccess extends HomeState {}
class ToggleFullScreenSuccess extends HomeState {}

class HomeError extends HomeState {
  final NetworkExceptions networkExceptions;
  HomeError({
    required this.networkExceptions,
  });
}
