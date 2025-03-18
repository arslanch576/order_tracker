import 'package:objectbox/objectbox.dart';

@Entity()
class Product{
  @Id()
  int id=0;
  String name;
  int price;
  String size;
  String category;
  String image;

  Product(this.id, this.name, this.price, this.size, this.category, this.image);
}