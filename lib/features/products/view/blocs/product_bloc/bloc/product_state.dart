part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final ProductModel data;

  ProductSuccess(this.data);
}

final class ProductFailure extends ProductState {
  final FailureModel error;

  ProductFailure(this.error);
}
