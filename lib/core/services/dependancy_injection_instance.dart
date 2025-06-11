import 'package:elaro/core/interceptor/interceptor.dart';
import 'package:elaro/features/favourite/view/blocs/bloc/favourite_bloc.dart';
import 'package:elaro/features/products/data/repository/products_repository_impl.dart';
import 'package:elaro/features/products/view/blocs/product_bloc/bloc/product_bloc.dart';
import 'package:elaro/features/products/view/blocs/products_bloc/bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> serviceLocator() async {
  _client();
  _styles();
  _dataSources();
  _repositories();
  _useCase();
  _blocs();
}

void _client() {
  sl.registerFactory(() => DioClient());
}

void _useCase() {}

void _repositories() {
  sl.registerLazySingleton<ProductsRepositoryImpl>(
    () => ProductsRepositoryImpl(sl<DioClient>()),
  );
}

void _blocs() {
  sl.registerFactory(() => ProductsBloc(sl<ProductsRepositoryImpl>()));
  sl.registerFactory(() => ProductBloc(sl<ProductsRepositoryImpl>()));
  sl.registerLazySingleton(() => FavouriteBloc());
}

void _dataSources() {}

void _styles() {}
