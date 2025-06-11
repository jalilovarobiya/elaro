import 'package:elaro/features/favourite/view/blocs/bloc/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favourites")),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (ctx, state) {
          if (state is FavouriteUpdate) {
            if (state.products.isEmpty) {
              return Center(child: Text("Hech qanday maxsulot yo'q"));
            }
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (ctx, index) {
                final product = state.products[index];
                return ListTile(
                  leading: Image.network(product.images[0].image),
                  title: Text(product.nameUz),
                  subtitle: Text(product.price),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<FavouriteBloc>().add(
                        DeleteFavouriteEvent(product.id),
                      );
                    },
                    icon: Icon(Icons.remove),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
