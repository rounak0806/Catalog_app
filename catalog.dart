import 'dart:convert';

class CatalogModel
{
  static final catModel = CatalogModel._internal();

  CatalogModel._internal();

  factory CatalogModel() => catModel;
  static  List<Item>?items;

  // Get Item by ID
   Item getById(int id) =>
      items!.firstWhere((element) => element.id == id, orElse: null);// Get Item by position
   Item getByPosition(int pos) => items![pos];


}

class Item {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);

  factory Item.fromMap(Map<String, dynamic>map) {
    return Item(
      map["id"],
      map["name"],
      map["desc"],
      map["price"],
      map["color"],
      map["image"],
    );
  }

  toMap() => {
    "id":id,
    "name":name,
    "desc":desc,
    "price":price,
    "color":color,
    "image":image
  };
  }


