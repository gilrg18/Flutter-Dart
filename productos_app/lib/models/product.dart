//quicktype.io
// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

// ignore_for_file: unnecessary_this

import 'dart:convert';

class Product {
  Product({
    required this.available,
    required this.name,
    this.picture,
    required this.price,
    this.id,
  });

  bool available;
  String name;
  String? picture;
  double price;
  String? id;
  //toma un string y genera una instancia de nuestro producto
  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));
  //json para mandarlo al servidor
  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
      };

  //hacemos una copia para romper la referencia original del arreglo products
  //para que no lo afecte al hacer modificaciones al producto origunal
  //hasta que se le de guardar
  Product copy() => Product(
        available: this.available,
        name: this.name,
        picture: this.picture,
        price: this.price,
        id: this.id,
      );
}
