import 'dart:convert';

class MenuModel {
  int id;
  String name;
  String description;
  List<dynamic> ingredients;
  bool spicy;
  bool vegetarian;
  var price;
  String image;

  MenuModel({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.spicy,
    required this.vegetarian,
    required this.price,
    required this.image,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        image: json['image'],
        ingredients: json['ingredients'],
        description: json['description'],
        spicy: json['spicy'],
        vegetarian: json['vegetarian']);
  }
}

List<MenuModel> menuFromJson(Object jsonString) {
  final data = json.decode(jsonString as String);
  return List<MenuModel>.from(data.map((menu) => MenuModel.fromJson(menu)));
}
