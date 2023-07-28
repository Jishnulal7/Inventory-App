import 'package:flutter/material.dart';
import 'package:inventory_app/screens/product/complete_order_product.dart';
import 'package:inventory_app/screens/product/product_add_screen.dart';
import 'package:inventory_app/screens/product/pending_product_screen.dart';
import 'package:inventory_app/widgets/drawer.dart';

import 'product/out_of_stock_product.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const id = 'tab_screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {
      'pageName': const PendingProductScreen(),
      'title': 'Pending Products',
    },
    {
      'pageName': const CompletedProductScreen(),
      'title': 'Completed Orders',
    },
    {
      'pageName': const OutofStockProductScreen(),
      'title': 'Out of stock Orders'
    },
  ];

  var _selectedPageIndex = 0;

  void _addProduct(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddProductScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addProduct(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      drawer: const MyDrawer(),
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addProduct(context),
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.add,
                color: Colors.deepPurple,
              ),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle),
            label: 'Pending Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Out of Stock',
          ),
        ],
      ),
    );
  }
}
