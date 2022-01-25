import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//ctrl + . sobre el error o warining para ver opciones
//MyApp es un widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //MaterialApp es otro widget
    //cuando sabes que algo no va a cambiar, se aconseja que el padre mas alto posible sea la constante (const)
    return const MaterialApp(
      //Center es otro widget
      home: Center(
        //Text es otro widget
        child: Text('Hola Mundo'),
      )
    );
  }
}
