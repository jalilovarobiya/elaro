part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final ProductsModel data;

  ProductsSuccess(this.data);
}

final class ProductsFailure extends ProductsState {
  final FailureModel error;

  ProductsFailure(this.error);
}
