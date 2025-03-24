import 'package:flutter/material.dart';
import 'package:order_tracker/main.dart';
import 'package:order_tracker/models/product.dart';
import 'package:order_tracker/objectbox.g.dart';
import 'package:order_tracker/pages/add_product.dart';
import 'package:order_tracker/widgets/product_widget.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  var items=objectBoxDatabase.productBox.query().watch(triggerImmediately: true);
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
      body: StreamBuilder(stream: items, builder: (context, snapshot) {
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);

        var products=snapshot.data!.find();
        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductWidget(
                product: products[index]);
          },
        );
      },)
    );
  }
}
