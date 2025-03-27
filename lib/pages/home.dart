import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:order_tracker/main.dart';
import 'package:order_tracker/models/product_order.dart';
import 'package:order_tracker/pages/add_order.dart';
import 'package:order_tracker/pages/orders.dart';
import 'package:order_tracker/pages/products.dart';
import 'package:order_tracker/widgets/order_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order Management"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentItem = value;
            });
          },
          currentIndex: currentItem,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Badge(
                child: Icon(Icons.home_outlined),
                label: Text("10"),
              ),
              activeIcon: Badge(
                child: Icon(Icons.home),
                label: Text("10"),
              ),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Products",
            ),
          ],
        ),
        body: [OrdersPage(), ProductsPage()][currentItem]);
  }
}
