import 'package:elaro/core/services/dependancy_injection_instance.dart';
import 'package:elaro/features/products/view/blocs/products_bloc/bloc/products_bloc.dart';
import 'package:elaro/features/products/view/widgets/products_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductsBloc>()..add(ProductsFetchEvent()),
      child: Scaffold(body: ProductsBody()),
    );
  }
}
