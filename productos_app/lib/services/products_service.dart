import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  //es final porque nunca se va a destruir y volverse a crear el objeto, solo vamos a editar sus valores internos
  final String _baseUrl = 'flutter-backend-38f00-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  //file opcional, puede que la tenga  o no (dart.io)
  File? newPictureFile;
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
    //si no tengo id, no tengo producto, crear producto y id
    if (product.id == null) {
      await createProduct(product);
    } else {
      //actualizar
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    //https://flutter-backend-38f00-default-rtdb.firebaseio.com/products/ABC123.json
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final response = await http.put(url, body: product.toJson());
    // ignore: unused_local_variable
    final decodedData = response.body;

    //print(decodedData);
    //actualizar el producto en el listado de productos:
    //indice del id del producto que estoy recibiendo
    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product; //reemplazar/actualizar el producto
    return product.id!;
  }

  Future<String> createProduct(Product product) async {
    //https://flutter-backend-38f00-default-rtdb.firebaseio.com/products.json
    final url = Uri.https(_baseUrl, 'products.json');
    final response = await http.post(url, body: product.toJson());

    //response.body es un string, convertir a mapa para poder asignar 'name' al product.id
    final decodedData = json.decode(response.body);
    //print(decodedData); //{"name":"-Mxrsk-Erl-mMj8d_Xht"} fb crea ese id
    product.id = decodedData['name']; // asignar 'name' al product.id
    products.add(product); //agregar producto nuevo al products
    return product.id!;
  }

  //metodo para mostrar la imagen seleccionada
  void updateSelectedProductImage(String path) {
    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));

    //para volver a dibujar (redibujar) los widgets que estan relacionados con el products_service
    //en este caso la pantalla de editar producto en la imagen que quiero cambiar/agregar
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;

    isSaving = true;
    notifyListeners();

    //api que calamos en postman de cloudinary
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dblbqaoe7/image/upload?upload_preset=ck7ayane');
    //crear request y asignar el parametro file
    final imageUploadRequest = http.MultipartRequest('POST', url);
    //adjuntar archivo al request en el parametro 'file' (cimo en postman)
    //newPictureFile puede ser nulo pero como ya hice la evaluacion previamente
    //se que tengo el archivo y por eso el newPictureFile!
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);
    //adjuntar file a imageUploadRequest
    imageUploadRequest.files.add(file);
    //disparar la peticion (streamResponse: respuesta de la peticion)
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salio mal');
      print(resp.body);
      return null;
    }

    newPictureFile = null;
    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];

    //print('Respuesta de cloudinary: ${resp.body}');
  }
}
