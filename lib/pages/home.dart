import 'package:flutter/material.dart';
import 'package:order_tracker/models/order.dart';
import 'package:order_tracker/pages/add_order.dart';
import 'package:order_tracker/pages/products.dart';
import 'package:order_tracker/widgets/order_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductsPage(),
                  )),
              icon: Icon(Icons.category))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddOrder(),
        )),
        label: Text("New Order"),
        icon: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return OrderWidget(
              Order(0, "Completed", "Arslan", "030012345678", []));
        },
      ),
    );
  }
}
