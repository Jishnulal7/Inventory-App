import 'package:flutter/material.dart';
import 'package:inventory_app/widgets/product_tile.dart';
import '../models/product_model.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.productList,
  });

  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var product = productList[index];
        return ProductTile(product: product);
      },
    );
  }
}


