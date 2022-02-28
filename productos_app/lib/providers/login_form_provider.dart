//gestor de estado
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool isValidForm() {
    print(formKey.currentState?.validate());
    print('$email - $password');
    return formKey.currentState?.validate() ?? false;
  }
}
