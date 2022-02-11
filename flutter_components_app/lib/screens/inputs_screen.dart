import 'package:flutter/material.dart';
import 'package:flutter_components_app/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Keys ayudan a mantener la referencia a los widgets
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'Gilberto',
      'last_name': 'Rangel',
      'email': 'lol@lol.com',
      'password': '12345',
      'role': 'admin'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Inputs y Forms'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'Nombre',
                  hintText: 'Nombre del usuario',
                  formProperty: 'first_name',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Apellido',
                  hintText: 'Apellido del usuario',
                  formProperty: 'last_name',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                // ignore: prefer_const_constructors
                CustomInputField(
                  labelText: 'Correo',
                  hintText: 'Correo del usuario',
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña del usuario',
                  obscureText: true,
                  formProperty: 'password',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Save')),
                  ),
                  onPressed: () {
                    //quitar el teclado
                    FocusScope.of(context).requestFocus(FocusNode());
                    //.currentState! - ! para decirle a dart que confie en ti
                    //que siempre vas a recibir ese valor
                    if (!myFormKey.currentState!.validate()) {
                      print('Formulario No Valido');
                      return;
                    }
                    //imprimir valores del formulario
                    print(formValues);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
