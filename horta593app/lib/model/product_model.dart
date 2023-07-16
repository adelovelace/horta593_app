// ignore_for_file: empty_constructor_bodies

import 'dart:convert';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String idProduct;
  String name;
  String description;
  String imageurl;
  String stateProduct;
  double price;

  Product({
    required this.idProduct,
    required this.name,
    required this.description,
    required this.imageurl,
    required this.stateProduct,
    required this.price,
  }) {}

  @override
  List<Object?> get props =>
      [idProduct, name, description, imageurl, stateProduct, price];

  static List<Product> getMenu() {
    return [
      Product(
          idProduct: '8001',
          name: "Hamburgesa de Quinoa y Garbanzo",
          description: "Carne de quinoa 3 garbanzos con tomate y pepinos.",
          imageurl:
              "https://2.bp.blogspot.com/-TdgeygGMV08/UwZE_PBicRI/AAAAAAAABtc/hgs8rsgV3Q8/s1600/263.JPG",
          stateProduct: "disponible",
          price: 4.00),
      Product(
          idProduct: '8002',
          name: "Hamburgesa de Lenteja",
          description: "Carne de lenteja, tomate y champinoes.",
          imageurl:
              "https://2.bp.blogspot.com/-TdgeygGMV08/UwZE_PBicRI/AAAAAAAABtc/hgs8rsgV3Q8/s1600/263.JPG",
          stateProduct: "agotado",
          price: 5.00),
      Product(
          idProduct: '8004',
          name: "Combo Hamburguesas",
          description: "Carne de quinoa 3 garbanzos con tomate y pepinos.",
          imageurl:
              "https://2.bp.blogspot.com/-TdgeygGMV08/UwZE_PBicRI/AAAAAAAABtc/hgs8rsgV3Q8/s1600/263.JPG",
          stateProduct: "disponible",
          price: 7.50),
    ];
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    final item = Product(
      idProduct: json['idProduct'],
      name: json['name'],
      description: json['description'],
      imageurl: json['imageurl'],
      stateProduct: json['stateProduct'],
      price: json['price'],
    );
    return item;
  }

  String toJson() {
    return jsonEncode(
      {
        'id': idProduct,
        'name': name,
        'description': description,
        'imageurl': imageurl,
        'stateProduct': stateProduct,
        'price': price,
      },
    );
  }
}
