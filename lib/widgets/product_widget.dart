import 'package:flutter/material.dart';
import 'package:order_tracker/models/product.dart';

class ProductWidget extends StatelessWidget {
  Product product;

  ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
      child: ListTile(
        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${product.category} | ${product.size}",
                style: TextStyle(color: Colors.grey, fontSize: 10)),
            Text("${product.price} Rs.", style: TextStyle(color: Colors.green))
          ],
        ),
      ),
    );
  }
}
