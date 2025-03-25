import 'package:flutter/material.dart';
import 'package:order_tracker/main.dart';

import '../models/product.dart';

class AddProduct extends StatefulWidget {
  Product? product;

  AddProduct({super.key, this.product});

  @override
  State<AddProduct> createState() => _AddProductState(p: product);
}

class _AddProductState extends State<AddProduct> {
  Product? p;
  late TextEditingController nameController;
  late TextEditingController priceController;

  _AddProductState({this.p}) {
    nameController = TextEditingController(text: p == null ? "" : p!.name);
    priceController =
        TextEditingController(text: p == null ? "" : p!.price.toString());
  }

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
    if (p == null)
      p = Product(0, name, int.parse(price), "Regular", "Burgers", "image");
    else {
      p!.name = name;
      p!.price = int.parse(price);
    }
    objectBoxDatabase.productBox.put(p!);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Product saved")));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(p==null?"Add product":"Update product"),
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
