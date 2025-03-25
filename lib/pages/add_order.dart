import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:order_tracker/main.dart';
import 'package:order_tracker/models/order_item.dart';
import 'package:order_tracker/models/product_order.dart';

class AddOrder extends StatelessWidget {
  const AddOrder({super.key});

  @override
  Widget build(BuildContext context) {

    void addDummyOrder(){
      ProductOrder order=ProductOrder("Danish", "03001234567");
      order.orderItems.add(OrderItem(1, 3, 200, "Loaded Fries"));
      order.orderItems.add(OrderItem(2, 2, 1200, "Small Pizza"));
      objectBoxDatabase.productOrderBox.put(order);
      Navigator.of(context).pop();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("New order"),
        ),
        body: Center(
          child: ElevatedButton(onPressed: addDummyOrder, child: Text("Add dummy order")),
        ));
  }
}
