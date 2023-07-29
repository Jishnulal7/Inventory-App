import 'package:flutter/material.dart';
import 'package:inventory_app/models/product_model.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({
    super.key,
    required this.cancelOrDeleteCallback,
    required this.product,
    required this.markOutofstock,
    required this.editTaskCallback,
    required this.restoreTaskCallback,
  });
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;

  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback markOutofstock;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: product.isDeleted == false
          ? (context) => [
                PopupMenuItem(
                  onTap: editTaskCallback,
                  child: TextButton.icon(
                    onPressed: editTaskCallback,
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                PopupMenuItem(
                  onTap: markOutofstock,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: product.isOutofStock == false
                        ? const Icon(
                            Icons.remove,
                            color: Colors.black,
                          )
                        : const Icon(Icons.add),
                    label: product.isOutofStock == false
                        ? const Text(
                            'Remove',
                            style: TextStyle(color: Colors.black),
                          )
                        : const Text('Add'),
                  ),
                ),
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ]
          : (context) => [
                PopupMenuItem(
                  onTap: restoreTaskCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.restore,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Restore',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Delete forever',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
    );
  }
}
