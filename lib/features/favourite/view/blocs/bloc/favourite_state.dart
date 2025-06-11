part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteUpdate extends FavouriteState {
  final List<Datum> products;

  FavouriteUpdate(this.products);
}
