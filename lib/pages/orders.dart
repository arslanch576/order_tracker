import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/order_widget.dart';
import 'add_order.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  var stream=objectBoxDatabase.productOrderBox.query().watch(triggerImmediately: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddOrder(),
        )),
        label: Text("New Order"),
        icon: Icon(Icons.add),
      ),
      body: StreamBuilder(stream: stream, builder: (context, snapshot) {
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
        var items=snapshot.data!.find();
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return OrderWidget(
                items[index]);
          },
        );
      },),
    );
  }
}
