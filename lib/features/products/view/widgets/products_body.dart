import 'package:elaro/features/products/view/blocs/products_bloc/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBody extends StatefulWidget {
  const ProductsBody({super.key});

  @override
  State<ProductsBody> createState() => _ProductsBodyState();
}

class _ProductsBodyState extends State<ProductsBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsFailure) {
          return Center(child: Text(state.error.error));
        }
        if (state is ProductsSuccess) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (contex, index) {
              return Container(
                color: Colors.red,
                child: Column(
                  children: [
                    Expanded(child: Container(color: Colors.amber)),
                    Text("data"),
                  ],
                ),
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
