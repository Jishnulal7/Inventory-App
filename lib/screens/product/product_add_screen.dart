import 'package:flutter/material.dart';
import 'package:inventory_app/bloc/bloc_exports.dart';
import 'package:inventory_app/models/product_model.dart';
import 'package:inventory_app/services/guid_gen.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text('Add Product'),
          const SizedBox(
            height: 15,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text('Product name'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  var product = Product(
                      title: titleController.text, id: GUIDGen.generate());
                  context.read<ProductBloc>().add(AddProduct(product: product));
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              )
            ],
          )
        ],
      ),
    );
  }
}
