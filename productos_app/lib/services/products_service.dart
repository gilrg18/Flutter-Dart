import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-backend-38f00-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  //es final porque nunca se va a destruir y volverse a crear el objeto, solo vamos a editar sus valores internos
  bool isLoading = true;

  ProductsService() {
    loadProducts();
  }

  //ctrl shift  p, add pubpspec dependencies, http
  //Fetch de productos
  Future loadProducts() async {
    final url = Uri.https(_baseUrl, 'products.json');
    final response = await http.get(url);
    //response.body is a string
    final Map<String, dynamic> productsMap = json.decode(response.body);
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });
    //print(this.products[0].name);
  }
}