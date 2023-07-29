import 'package:flutter/material.dart';
import 'package:inventory_app/bloc/bloc_exports.dart';
import 'package:inventory_app/widgets/drawer.dart';
import 'package:inventory_app/widgets/product_listing.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            titleSpacing: 0,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Chip(
                    label: Text('${state.removedProducts.length} Products')),
              ),
              const SizedBox(
                height: 10,
              ),
              ProductList(productList: state.removedProducts),
            ],
          ),
        );
      },
    );
  }
}
