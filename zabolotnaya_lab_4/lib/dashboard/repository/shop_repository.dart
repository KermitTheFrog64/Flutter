import 'package:zabolotnaya_lab_4/dashboard/model/shop_model.dart';
import 'package:hive/hive.dart';

class ShopRepository {
  late final Box _shopBox;

  Future<void> init() async {
    Hive.registerAdapter(ShopAdapter());
    _shopBox = await Hive.openBox<Shop>('shops');
  }

  Box get userBox => _shopBox;

  //get items from hive database
  List<Shop> getShops() {
    final shopList = _shopBox.values.toList();
    return shopList as List<Shop>;
  }

  // adding item to hive db
  Future<List<Shop>> addShop(Shop newShop) async {
    await _shopBox.add(newShop);
    return getShops();
  }

  // remove item from hive db
  Future<List<Shop>> removeShop(String id) async {
    final shopToDelete =
    await _shopBox.values.firstWhere((element) => element.id == id);
    await shopToDelete.delete();
    return getShops();
  }

  // update item info
  Future<List<Shop>> updateShopInfo(Shop shop) async {
    final shopToUpdate = await _shopBox.values.firstWhere((element) {
      return element.id == shop.id;
    });
    final index = shopToUpdate.key;
    await _shopBox.put(index, shop);

    return getShops();
  }
}
