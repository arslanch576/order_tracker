import 'package:order_tracker/models/product.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../objectbox.g.dart';

class ObjectBoxDatabase{
  Store store;
  late Box<Product> productBox;
  static ObjectBoxDatabase? objectBoxDatabase;

  ObjectBoxDatabase(this.store){
    productBox=store.box<Product>();
  }

  static Future<ObjectBoxDatabase> create() async {
    if(objectBoxDatabase!=null) return objectBoxDatabase!;
    final docsDir = await getApplicationDocumentsDirectory();
    Store store=await openStore(directory: p.join(docsDir.path,"order_db_v3"));
    objectBoxDatabase= ObjectBoxDatabase(store);
    return objectBoxDatabase!;
  }

}