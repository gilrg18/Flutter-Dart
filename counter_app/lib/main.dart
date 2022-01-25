import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//ctrl + . sobre el error para ver opciones
//MyApp es un widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MaterialApp es otro widget
    return MaterialApp(
      home: Center(
        child: Text('Hola Mundo')
      )
    );
  }
}
