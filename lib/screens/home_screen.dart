import 'package:flutter/material.dart';
import 'package:inventory_app/screens/product/complete_order_product.dart';
import 'package:inventory_app/screens/product/add_product_screen.dart';
import 'package:inventory_app/screens/product/pending_product_screen.dart';
import 'package:inventory_app/widgets/drawer.dart';

import 'product/out_of_stock_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      isScrollControlled: true,
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
            // onPressed: () => _addProduct(context),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'signin_screen');
            },
            icon: const Icon(Icons.logout),
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
