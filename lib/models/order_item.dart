
import 'package:objectbox/objectbox.dart';
import 'package:order_tracker/models/product_order.dart';

@Entity()
class OrderItem{
  @Id()
  int id=0;

  ToOne<ProductOrder> order=ToOne<ProductOrder>();
  int productId;
  int qty;
  int price;
  String productName;

  OrderItem(this.productId, this.qty, this.price, this.productName);
}