import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-backend-38f00-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  //es final porque nunca se va a destruir y volverse a crear el objeto, solo vamos a editar sus valores internos
  bool isLoading = true;
  bool isSaving = false;
  //late porque al principio no va a tener un valor, si no hasta que selecciones un producto
  late Product selectedProduct;

  ProductsService() {
    loadProducts();
  }

  //ctrl shift  p, add pubpspec dependencies, http
  //Fetch de productos
  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners(); //para notificar a cualquier otro widget que le interese saber cuando estamos cargando y se redibujen si isLoading cambia
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
    isLoading = false;
    notifyListeners();
    return products;
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();
    //si no tengo id, no tengo producto, crear producto
    if (product.id == null) {
    } else {
      //actualizar
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    //https://flutter-backend-38f00-default-rtdb.firebaseio.com/products/ABC123
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final response = await http.put(url, body: product.toJson());
    final decodedData = response.body;

    print(decodedData);
    //actualizar el producto en el listado de productos:
    //indice del id del producto que estoy recibiendo
    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product; //reemplazar/actualizar el producto
    return product.id!;
  }
}
