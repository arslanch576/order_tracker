import 'package:order_tracker/models/product.dart';

class Order {
  int id;
  String status;
  String customerName;
  String customerContact;
  List<Product> products;

  Order(this.id, this.status, this.customerName, this.customerContact,
      this.products);
  
  int getTotal(){
    return products.fold<int>(0, (previousValue, element) => previousValue+element.price);
  }

}
