import 'package:order_tracker/models/product.dart';

import '../objectbox.g.dart';

class ObjectBoxDatabase{
  Store store;
  late Box<Product> productBox;

  ObjectBoxDatabase(this.store){
    productBox=store.box<Product>();
  }

  Future<ObjectBoxDatabase> create() async {
    Store store=await openStore(directory: "order_db_v1");
    return ObjectBoxDatabase(store);
  }

}