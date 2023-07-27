import 'package:flutter/material.dart';

class AddorUpdateProduct extends StatefulWidget {
  const AddorUpdateProduct({super.key});

  @override
  State<AddorUpdateProduct> createState() => _AddorUpdateProductState();
}

class _AddorUpdateProductState extends State<AddorUpdateProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a product'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('Name'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
