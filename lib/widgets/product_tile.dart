import 'package:flutter/material.dart';
import 'package:inventory_app/bloc/bloc_exports.dart';
import 'package:inventory_app/models/product_model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final Product product;

  void _removeOrDeleteProduct(BuildContext context, Product product) {
    product.isDeleted!
        ? context.read<ProductBloc>().add(DeleteProduct(product: product))
        : context.read<ProductBloc>().add(RemoveProduct(product: product));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          product.title,
          style: TextStyle(
              decoration: product.isDone! ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          onChanged: product.isDeleted == false
              ? (value) {
                  context
                      .read<ProductBloc>()
                      .add(UpdateProduct(product: product));
                }
              : null,
          value: product.isDone,
        ),
        onLongPress: () => _removeOrDeleteProduct(context, product));
  }
}
