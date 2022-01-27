//Primero paquetes de flutter
import 'package:counter_app/screens/counter_screen.dart';
import 'package:flutter/material.dart';
//Segundo paquetes de terceros
// import 'package:counter_app/screens/home_screen.dart';

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
        //quitar la etiqueta de debug de la esquina
        debugShowCheckedModeBanner: false,
        home: CounterScreen());
  }
}
