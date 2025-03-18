import 'package:flutter/material.dart';
import 'package:order_tracker/models/product.dart';
import 'package:order_tracker/pages/add_product.dart';
import 'package:order_tracker/widgets/product_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddProduct(),
        )),
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductWidget(
              product: Product(
                  0, "Zinger burger", 320, "Regular", "Burgers", "image"));
        },
      ),
    );
  }
}
