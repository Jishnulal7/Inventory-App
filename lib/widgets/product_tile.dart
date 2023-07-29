import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_app/bloc/bloc_exports.dart';
import 'package:inventory_app/models/product_model.dart';
import 'package:inventory_app/screens/product/edit_product_screen.dart';
import 'package:inventory_app/widgets/popup_menu.dart';

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

  void _editTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: EditProductScreen(
                  oldProduct: product,
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              product.isOutofStock == false
                  ? const Icon(Icons.star_border_outlined)
                  : const Icon(Icons.star),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          decoration: product.isDone!
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        DateFormat().add_yMMMEd().format(DateTime.now()),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(
              onChanged: product.isDeleted == false
                  ? (value) {
                      context
                          .read<ProductBloc>()
                          .add(UpdateProduct(product: product));
                    }
                  : null,
              value: product.isDone,
            ),
            PopUpMenu(
              cancelOrDeleteCallback: () =>
                  _removeOrDeleteProduct(context, product),
              product: product,
              markOutofstock: () => context.read<ProductBloc>().add(
                    MarkOutofStock(product: product),
                  ),
              editTaskCallback: () =>
                // Navigator.of(context).pop();
                _editTask(context)
              
              ,
              restoreTaskCallback: () => context
                  .read<ProductBloc>()
                  .add(RestoreProduct(product: product)),
            )
          ],
        ),
      ],
    );
  }
}
