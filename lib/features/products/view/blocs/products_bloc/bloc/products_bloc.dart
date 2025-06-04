import 'package:bloc/bloc.dart';
import 'package:elaro/core/error/failure_model.dart';
import 'package:elaro/features/products/data/model/products_model.dart';
import 'package:elaro/features/products/data/repository/products_repository_impl.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepositoryImpl impl;
  ProductsBloc(this.impl) : super(ProductsLoading()) {
    on<ProductsFetchEvent>(_productsFetchEvent);
    on<ProductsFetchNewEvent>(_productsFetchNewEvent);
    on<ProductsFetchHitEvent>(_productsFetchHitEvent);
    on<ProductsFetchDiscountEvent>(_productsFetchDiscountEvent);
  }

  _productsFetchEvent(
    ProductsFetchEvent event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(ProductsLoading());
      final request = await impl.fetchProducts();
      emit(ProductsSuccess(request));
    } catch (e) {
      emit(ProductsFailure(FailureModel(e.toString())));
    }
  }

  _productsFetchNewEvent(
    ProductsFetchNewEvent event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(ProductsLoading());
      final request = await impl.fetchNewProducts();
      emit(ProductsSuccess(request));
    } catch (e) {
      emit(ProductsFailure(FailureModel(e.toString())));
    }
  }

  _productsFetchHitEvent(
    ProductsFetchHitEvent event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(ProductsLoading());
      final request = await impl.fetchHitProducts();
      emit(ProductsSuccess(request));
    } catch (e) {
      emit(ProductsFailure(FailureModel(e.toString())));
    }
  }

  _productsFetchDiscountEvent(
    ProductsFetchDiscountEvent event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(ProductsLoading());
      final request = await impl.fetchDiscountProducts();
      emit(ProductsSuccess(request));
    } catch (e) {
      emit(ProductsFailure(FailureModel(e.toString())));
    }
  }
}
