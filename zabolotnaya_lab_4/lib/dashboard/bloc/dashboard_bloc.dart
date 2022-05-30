import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:zabolotnaya_lab_4/dashboard/model/shop_model.dart';
import 'package:zabolotnaya_lab_4/dashboard/repository/shop_repository.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final ShopRepository shopRepository;
  DashboardBloc({required this.shopRepository}) : super(DashboardInitial()) {
    on<InitShopBox>(_initShopBox);
    on<FetchAllShopEvent>(_fetchAllShop);
    on<AddShopEvent>(_addNewShop);
    on<RemoveShopEvent>(_removeShop);
    on<UpdateShopEvent>(_updateShop);
  }

  FutureOr<void> _fetchAllShop(
      FetchAllShopEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoading());
      final shopList = shopRepository.getShops();
      emit(DashboardLoaded(shopList: shopList));
    } catch (e) {
      emit(DashboardError(error: e.toString()));
    }
  }

  FutureOr<void> _addNewShop(
      AddShopEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoading());
      final updatedShopList = await shopRepository.addShop(event.shop);
      emit(DashboardLoaded(shopList: updatedShopList));
    } catch (e) {
      emit(DashboardError(error: e.toString()));
    }
  }

  FutureOr<void> _initShopBox(
      InitShopBox event, Emitter<DashboardState> emit) async {
    await shopRepository.init();
    add(FetchAllShopEvent());
  }

  FutureOr<void> _removeShop(
      RemoveShopEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoading());
      final updatedShopList = await shopRepository.removeShop(event.id);
      emit(DashboardLoaded(shopList: updatedShopList));
    } catch (e) {
      emit(DashboardError(error: e.toString()));
    }
  }

  FutureOr<void> _updateShop(
      UpdateShopEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoading());
      final updatedShopList = await shopRepository.updateShopInfo(event.shop);
      emit(DashboardLoaded(shopList: updatedShopList));
    } catch (e) {
      emit(DashboardError(error: e.toString()));
    }
  }
}
