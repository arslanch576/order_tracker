import 'package:flutter/material.dart';
import 'package:order_tracker/main.dart';
import 'package:order_tracker/models/product_order.dart';
import 'package:order_tracker/pages/add_order.dart';
import 'package:order_tracker/pages/products.dart';
import 'package:order_tracker/widgets/order_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var stream=objectBoxDatabase.productOrderBox.query().watch(triggerImmediately: true);
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
      },)
    );
  }
}
