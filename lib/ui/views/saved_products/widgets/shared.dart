import 'package:weight_mate/models/saved_product.dart';

String priceTypeSuffix(PriceType type) {
  switch (type) {
    case PriceType.kg:
      return ' / kg';
    case PriceType.gm:
      return ' / gm';
    case PriceType.piece:
      return ' / piece';
    case PriceType.dozen:
      return ' / dozen';
  }
}
