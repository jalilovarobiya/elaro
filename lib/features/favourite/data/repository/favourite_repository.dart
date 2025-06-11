import 'package:elaro/features/favourite/data/model/favourite_product.dart';
import 'package:hive/hive.dart';

class FavouriteRepository {
  static const String _boxName = "favourites";

  Future<Box<FavouriteProduct>> get _box async {
    return await Hive.openBox<FavouriteProduct>(_boxName);
  }

  Future<List<FavouriteProduct>> getFavourites() async {
    final box = await _box;
    return box.values.toList();
  }

  Future<void> addFavourite(FavouriteProduct product) async {
    final box = await _box;
    return box.put(product.id, product);
  }

  Future<void> removeFavourite(int productId) async {
    final box = await _box;
    return box.delete(productId);
  }

  Future<bool> isFavourite(int productId) async {
    final box = await _box;
    return box.containsKey(productId);
  }

  Future<void> clearFavourites() async {
    final box = await _box;
    await box.clear();
  }
}
