import 'package:objectbox/objectbox.dart';
import 'package:order_tracker/models/order_item.dart';
import 'package:order_tracker/models/product.dart';

@Entity()
class Order {
  @Id()
  int id;
  String status;
  String customerName;
  String customerContact;

  @Backlink('order')
  ToMany<OrderItem> orderItems=ToMany<OrderItem>();

  Order(this.id, this.status, this.customerName, this.customerContact);
  
  int getTotal(){
    return orderItems.fold<int>(0, (previousValue, element) => previousValue+element.price);
  }

}
