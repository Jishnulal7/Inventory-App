import 'package:flutter/material.dart';
import 'package:inventory_app/bloc/bloc_exports.dart';
import 'package:inventory_app/models/product_model.dart';

class EditProductScreen extends StatelessWidget {
  final Product oldProduct;
  const EditProductScreen({
    Key? key,
    required this.oldProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldProduct.title);
    TextEditingController descriptionController =
        TextEditingController(text: oldProduct.description);
    TextEditingController quantityController =
        TextEditingController(text: oldProduct.quantity);
    TextEditingController rateController =
        TextEditingController(text: oldProduct.title);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text(
          'Edit Product',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          autofocus: true,
          keyboardType: TextInputType.number,
          controller: quantityController,
          decoration: const InputDecoration(
            label: Text('Quantity'),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          autofocus: true,
          keyboardType: TextInputType.number,
          controller: rateController,
          decoration: const InputDecoration(
            label: Text('Rate'),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          autofocus: true,
          controller: descriptionController,
          minLines: 3,
          maxLines: 5,
          decoration: const InputDecoration(
            label: Text('Description'),
            border: OutlineInputBorder(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                var editedProduct = Product(
                  title: titleController.text,
                  description: descriptionController.text,
                  id: oldProduct.id,
                  isDone: false,
                  isOutofStock: oldProduct.isOutofStock,
                  date: DateTime.now().toString(),
                  quantity: quantityController.text,
                  rate: rateController.text,
                );
                context.read<ProductBloc>().add(EditProduct(
                      oldProduct: oldProduct,
                      newProduct: editedProduct,
                    ));
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ]),
    );
  }
}
