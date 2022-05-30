part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<Shop> shopList;
  const DashboardLoaded({
    required this.shopList,
  });
}

class DashboardError extends DashboardState {
  final String error;
  const DashboardError({
    required this.error,
  });
}
