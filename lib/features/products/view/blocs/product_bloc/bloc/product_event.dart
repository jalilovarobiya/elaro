part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class ProductFetchByIdEvent extends ProductEvent {
  final int id;
  ProductFetchByIdEvent(this.id);
}
