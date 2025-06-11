import 'package:elaro/core/services/dependancy_injection_instance.dart';
import 'package:elaro/features/favourite/view/blocs/bloc/favourite_bloc.dart';
import 'package:elaro/features/home/view/widgets/my_carusel.dart';
import 'package:elaro/features/products/view/blocs/products_bloc/bloc/products_bloc.dart';
import 'package:elaro/features/products/view/pages/products_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            SizedBox(height: 10),
            MyCarusel(),
            Text(
              "Ommabop kategoryalar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            BlocProvider(
              create:
                  (context) => sl<ProductsBloc>()..add(ProductsFetchEvent()),
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsFailure) {
                    return SizedBox();
                  }
                  if (state is ProductsSuccess) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (contex) => ProductsPage(data: state.data),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 200,
                        child: ListView.separated(
                          itemCount: state.data.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (contex, index) {
                            final data = state.data.data[index];
                            return SizedBox(
                              width: 200,
                              child: Column(
                                children: [
                                  Text(
                                    data.nameUz,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 120,
                                    // width: 100,
                                    child: Image.network(
                                      data.images.isNotEmpty
                                          ? data.images[0].image
                                          : "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: 12);
                          },
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(color: Colors.red),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tavsiya etilgan mahsulotlar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("Xammasi", style: TextStyle(fontSize: 20)),
              ],
            ),
            BlocProvider(
              create:
                  (context) => sl<ProductsBloc>()..add(ProductsFetchEvent()),
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsFailure) {
                    return SizedBox();
                  }
                  if (state is ProductsSuccess) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (contex) => ProductsPage(data: state.data),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 230,
                        child: ListView.separated(
                          itemCount: state.data.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (contex, index) {
                            final data = state.data.data[index];
                            return Stack(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 120,
                                        child: Image.network(
                                          data.images.isNotEmpty
                                              ? data.images[0].image
                                              : "",

                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(data.nameUz),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(data.price),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.shopping_cart_outlined,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: BlocBuilder<
                                    FavouriteBloc,
                                    FavouriteState
                                  >(
                                    builder: (context, state) {
                                      final isFavourite =
                                          state is FavouriteUpdate &&
                                          state.products.any(
                                            (e) => e.id == data.id,
                                          );
                                      return IconButton(
                                        onPressed: () {
                                          if (isFavourite) {
                                            context.read<FavouriteBloc>().add(
                                              DeleteFavouriteEvent(data.id),
                                            );
                                          } else {
                                            context.read<FavouriteBloc>().add(
                                              AddFavouriteEvent(data),
                                            );
                                          }
                                        },

                                        icon: Icon(
                                          isFavourite
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.red,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: 12);
                          },
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(color: Colors.red),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
