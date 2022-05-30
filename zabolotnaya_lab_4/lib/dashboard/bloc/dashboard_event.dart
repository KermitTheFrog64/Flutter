part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class InitShopBox extends DashboardEvent {}

class FetchAllShopEvent extends DashboardEvent {}

class AddShopEvent extends DashboardEvent {
  final Shop shop;
  const AddShopEvent({
    required this.shop,
  });
}

class RemoveShopEvent extends DashboardEvent {
  final String id;
  const RemoveShopEvent({
    required this.id,
  });
}

class UpdateShopEvent extends DashboardEvent {
  final Shop shop;
  const UpdateShopEvent({
    required this.shop,
  });
}
