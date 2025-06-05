import 'package:elaro/features/products/data/model/products_model.dart';
import 'package:flutter/material.dart';

class ProductsBody extends StatefulWidget {
  final ProductsModel data;
  const ProductsBody({super.key, required this.data});

  @override
  State<ProductsBody> createState() => _ProductsBodyState();
}

class _ProductsBodyState extends State<ProductsBody> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.data.data.length,
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (contex, index) {
        final data = widget.data.data[index];
        return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(data.images[index].image),
              Spacer(),
              Text(data.nameUz),
              Text(data.price),
            ],
          ),
        );
      },
    );
  }
}
