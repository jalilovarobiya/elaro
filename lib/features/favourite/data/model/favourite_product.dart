import 'package:elaro/features/products/data/model/products_model.dart';
import 'package:hive/hive.dart';

part "favourite_product.g.dart";

@HiveType(typeId: 0)
class FavouriteProduct extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String price;

  @HiveField(3)
  final List image;

  FavouriteProduct({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
  });

  factory FavouriteProduct.fromDatumn(Datum datumn) {
    return FavouriteProduct(
      id: datumn.id,
      image: datumn.images,
      name: datumn.nameUz,
      price: datumn.price,
    );
  }
}
