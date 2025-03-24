
import 'package:objectbox/objectbox.dart';

@Entity()
class OrderItem{
  @Id()
  int id=0;

  ToOne<Order> order=ToOne<Order>();
  int productId;
  int qty;
  int price;
  String productName;

  OrderItem(this.productId, this.qty, this.price, this.productName);
}