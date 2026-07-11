import 'package:isar/isar.dart';

part 'saved_product.g.dart';

enum PriceType { kg, gm, piece, dozen }

@collection
class SavedProduct {
  Id id = Isar.autoIncrement;

  @Index()
  String name;

  double price;

  @Enumerated(EnumType.name)
  PriceType priceType;

  @Index()
  DateTime createdAt;

  SavedProduct({
    required this.name,
    required this.price,
    required this.priceType,
    required this.createdAt,
  });
}
