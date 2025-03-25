import 'package:order_tracker/models/order_item.dart';
import 'package:order_tracker/models/product.dart';
import 'package:order_tracker/models/product_order.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../objectbox.g.dart';

class ObjectBoxDatabase{
  Store store;
  late Box<Product> productBox;
  late Box<ProductOrder> productOrderBox;
  late Box<OrderItem> orderItemBox;
  static ObjectBoxDatabase? objectBoxDatabase;

  ObjectBoxDatabase(this.store){
    productBox=store.box<Product>();
    productOrderBox=store.box<ProductOrder>();
    orderItemBox=store.box<OrderItem>();
  }

  static Future<ObjectBoxDatabase> create() async {
    if(objectBoxDatabase!=null) return objectBoxDatabase!;
    final docsDir = await getApplicationDocumentsDirectory();
    Store store=await openStore(directory: p.join(docsDir.path,"order_db_v4"));
    objectBoxDatabase= ObjectBoxDatabase(store);
    return objectBoxDatabase!;
  }

}