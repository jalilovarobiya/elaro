part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteEvent {}

class AddFavouriteEvent extends FavouriteEvent {
  final Datum product;

  AddFavouriteEvent(this.product);
}

class DeleteFavouriteEvent extends FavouriteEvent {
  final int productId;

  DeleteFavouriteEvent(this.productId);
}
