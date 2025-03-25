import 'package:objectbox/objectbox.dart';
import 'package:order_tracker/models/order_item.dart';
import 'package:order_tracker/models/product.dart';

@Entity()
class ProductOrder {
  @Id()
  int id=0;
  String status="Pending";
  String customerName;
  String customerContact;

  @Backlink('order')
  ToMany<OrderItem> orderItems=ToMany<OrderItem>();

  ProductOrder( this.customerName, this.customerContact);
  
  int getTotal(){
    return orderItems.fold<int>(0, (previousValue, element) => previousValue+element.price);
  }

}
