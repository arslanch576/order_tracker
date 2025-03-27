import 'package:flutter/material.dart';
import 'package:order_tracker/main.dart';
import 'package:order_tracker/models/product.dart';
import 'package:order_tracker/pages/add_product.dart';
import 'package:order_tracker/pages/products.dart';

class ProductWidget extends StatelessWidget {
  Product product;

  ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        onTap: () {
          showCustomDialog(context);
        },
        onLongPress: () {
          showOptions(context);
        },
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

  void showCustomDialog(BuildContext context){
    showDialog(context: context, builder: (context) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.heart_broken),
            Text("Are you heart broken"),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Mee too")));
            }, child: Text("Yes"))
          ],

        ),
      );
    },);
  }

  void showOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Options"),
          children: [
            SimpleDialogOption(
              child: Text("Edit"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddProduct(
                        product: product,
                      ),
                    ));
              },
            ),
            SimpleDialogOption(
              child: Text("Delete"),
              onPressed: () {
                Navigator.of(context).pop();
                showDeleteWarning(context);
              },
            ),
          ],
        );
      },
    );
  }

  void showDeleteWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Sure to delete?"),
          content: Text(
              "The product will be deleted permanently, sure to continue?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  objectBoxDatabase.productBox.remove(product.id);
                },
                child: Text("Yes")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("No")),
          ],
        );
      },
    );
  }
}
