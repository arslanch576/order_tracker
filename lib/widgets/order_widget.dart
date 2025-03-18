import 'package:flutter/material.dart';
import 'package:order_tracker/models/order.dart';

class OrderWidget extends StatelessWidget {
  Order order;

  OrderWidget(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: ListTile(
        title: Text(
          order.customerName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order id:845${order.id} | ${order.products.length} Item's",
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
            Text(
              "${order.getTotal()} Rs.",
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
        trailing: Card(
          color:
              order.status == "Completed" ? Colors.greenAccent : Colors.amber,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Text(
              order.status,
              style: TextStyle(
                  fontSize: 12,
                  color:
                      order.status == "Completed" ? Colors.green : Colors.pink),
            ),
          ),
        ),
      ),
    );
  }
}
