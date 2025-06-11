import 'package:bloc/bloc.dart';
import 'package:elaro/features/products/data/model/product_model.dart';
import 'package:elaro/features/products/data/model/products_model.dart';
import 'package:meta/meta.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final List<Datum> _favourites = [];

  FavouriteBloc() : super(FavouriteInitial()) {
    on<AddFavouriteEvent>(_addFavouriteEvent);
    on<DeleteFavouriteEvent>(_deleteFavouriteEvent);
  }

  _addFavouriteEvent(AddFavouriteEvent event, Emitter<FavouriteState> emit) {
    if (!_favourites.any((e) => e.id == event.product.id)) {
      _favourites.add(event.product);
    }
    emit(FavouriteUpdate(List.from(_favourites)));
  }

  _deleteFavouriteEvent(
    DeleteFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) {
    _favourites.removeWhere((e) => e.id == event.productId);
    emit(FavouriteUpdate(List.from(_favourites)));
  }
}
