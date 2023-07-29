import 'package:flutter/material.dart';
import 'package:inventory_app/bloc/bloc_exports.dart';
import 'package:inventory_app/widgets/product_listing.dart';

import '../../models/product_model.dart';

// ignore: must_be_immutable
class OutofStockProductScreen extends StatelessWidget {
  const OutofStockProductScreen({super.key});
  static const id = 'product_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        List<Product> productList = state.outofStockProducts;
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Chip(
                label: Text(
                  '${productList.length} Products',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ProductList(productList: productList)
          ],
        );
      },
    );
  }
}
