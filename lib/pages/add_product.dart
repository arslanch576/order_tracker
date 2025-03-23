import 'package:flutter/material.dart';
import 'package:order_tracker/main.dart';

import '../models/product.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String? nameError;
  String? priceError;

  void saveProduct() {
    setState(() {
      nameError = null;
      priceError = null;
    });
    String name = nameController.text;
    String price = priceController.text;

    if (name.isEmpty) {
      setState(() {
        nameError = "Name is required";
      });
      return;
    }
    if (price.isEmpty) {
      setState(() {
        priceError = "Price is required";
      });
      return;
    }

    Product product = Product(0,name, int.parse(price), "Regular", "Burgers", "image");
    objectBoxDatabase.productBox.put(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Enter product name",
                labelText: "Product name",
                border: OutlineInputBorder(),
                errorText: nameError,
              ),
              controller: nameController,
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter product price",
                labelText: "Product price",
                border: OutlineInputBorder(),
                errorText: priceError,
              ),
              keyboardType: TextInputType.number,
              controller: priceController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: saveProduct, child: Text("Save"))
          ],
        ),
      ),
    );
  }
}
