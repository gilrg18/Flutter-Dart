import 'package:flutter/material.dart';
import 'package:flutter_components_app/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Keys ayudan a mantener la referencia a los widgets
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_Name': 'Gilberto',
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
                const CustomInputField(
                    labelText: 'Nombre', hintText: 'Nombre del usuario'),
                const SizedBox(height: 30),
                const CustomInputField(
                    labelText: 'Apellido', hintText: 'Apellido del usuario'),
                const SizedBox(height: 30),
                const CustomInputField(
                  labelText: 'Correo',
                  hintText: 'Correo del usuario',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 30),
                const CustomInputField(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña del usuario',
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: const Text('Save')),
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
