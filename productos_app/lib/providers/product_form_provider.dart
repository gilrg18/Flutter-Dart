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
    print(value);
    product.available = value;
    notifyListeners();
  }

  bool isValidForm() {
    //si regresa null (??) va a ser false
    return formKey.currentState?.validate() ?? false;
  }
}
