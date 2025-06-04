import 'package:bloc/bloc.dart';
import 'package:elaro/core/error/failure_model.dart';
import 'package:elaro/features/products/data/model/product_model.dart';
import 'package:elaro/features/products/data/repository/products_repository_impl.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsRepositoryImpl impl;
  ProductBloc(this.impl) : super(ProductLoading()) {
    on<ProductFetchByIdEvent>(_productFetchByIdEvent);
  }
  _productFetchByIdEvent(
    ProductFetchByIdEvent event,
    Emitter<ProductState> emit,
  ) async {
    try {
      emit(ProductLoading());
      final request = await impl.fetchProductsById(event.id);
      emit(ProductSuccess(request));
    } catch (e) {
      emit(ProductFailure(FailureModel(e.toString())));
    }
  }
}
