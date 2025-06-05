import 'package:elaro/features/products/data/model/products_model.dart';
import 'package:elaro/features/products/view/widgets/products_body.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final ProductsModel data;
  const ProductsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        actions: [
          Icon(Icons.file_upload_outlined, color: Colors.white),
          Icon(Icons.favorite_border, color: Colors.white),
        ],
      ),
      body: ProductsBody(data: data),
    );
  }
}
