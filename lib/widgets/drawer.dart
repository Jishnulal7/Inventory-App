import 'package:flutter/material.dart';
import 'package:inventory_app/screens/bin.dart';

import 'package:inventory_app/screens/tab_screen.dart';

import '../bloc/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.deepPurple,
              child: const Text(
                'Drawer',
                style: TextStyle(color: Colors.white),
              ),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(TabScreen.id),
                  child: ListTile(
                    title: const Text('Products'),
                    leading: const Icon(Icons.folder),
                    trailing: Text('${state.pendingProducts.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  child: ListTile(
                    title: const Text('Bin'),
                    leading: const Icon(Icons.delete),
                    trailing: Text('${state.removedProducts.length}'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
