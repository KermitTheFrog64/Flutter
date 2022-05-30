import 'package:hive/hive.dart';

part 'shop_model.g.dart';

@HiveType(typeId: 0)
class Shop extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String quantity;
  @HiveField(2)
  final String aisle;
  @HiveField(3)
  final String id;

  Shop({
    required this.name,
    required this.quantity,
    required this.aisle,
    required this.id,
  });
}