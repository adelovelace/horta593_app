// ignore_for_file: empty_constructor_bodies

import 'dart:convert';

class Product {
  final String id_product;
  String name;
  String description;
  String imageurl;
  String state_product;
  double price;

  Product({
    required this.id_product,
    required this.name,
    required this.description,
    required this.imageurl,
    required this.state_product,
    required this.price,
  }) {
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    final item = Product(
      id_product: json['id_product'],
      name: json['name'],
      description: json['description'],
      imageurl: json['imageurl'],
      state_product: json['state_product'],
      price: json['price'],
    );
    return item;
    }


  String toJson() {
    return jsonEncode(
      {
        'id': id_product,
        'name':name,
        'description':description,
        'imageurl':imageurl,
        'state_product':state_product,
        'price':price,
      },
    );
  }
}
