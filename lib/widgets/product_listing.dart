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
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: productList
              .map(
                (product) => ExpansionPanelRadio(
                  value: product.id,
                  headerBuilder: (context, isOpen) =>
                      ProductTile(product: product),
                  body: ListTile(
                    title: SelectableText.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Title\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: product.title),
                          const TextSpan(
                            text: '\n\nQuantity\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: product.quantity),
                          const TextSpan(
                            text: '\n\nRate\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: product.rate),
                          const TextSpan(
                            text: '\n\nDescription\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: product.description),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
