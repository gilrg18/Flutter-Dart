// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  //mantener la referencia del formulario en este formKey
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Product product;

  //el product tiene que ser una copia y no sea el mismo valor de nuestro
  //arreglo de products poprque si no hariamos modificaciones al mismo elemento
  //porque todos los objetos pasan por referencia
  ProductFormProvider(this.product);

  updateAvailability(bool value) {
    product.available = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(product.name);
    print(product.price);
    print(product.available);
    //si regresa null (??) va a ser false
    return formKey.currentState?.validate() ?? false;
  }
}
