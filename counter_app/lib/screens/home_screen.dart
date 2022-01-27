//widget independiente

import 'package:flutter/material.dart';

//BuildContext lugar donde fue creado el widget,
//accedes al arbol de widgets con la lupa azul en la barra de herramientas
//donde inicias/detienes la app.
//StatelessWidget es el que crea y establece que la clase sea un widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);
    //Solo estos widgets son reconocidos en este Build Context,
    //cualquier otro build context que este afuera no reconoce estos widgets
    int counter = 0;
    return Scaffold(
      //appBar: widget con cierto tamanio definido
      appBar: AppBar(
        title: const Center(child: Text('Home Screen')),
        elevation: 10.0, //sombrita en la barra del titulo
      ),
      body:
          //Para tener un widget con mas de un child puedes usar Column o Row
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Clicks Counter', style: fontSize30),
            Text('$counter', style: fontSize30),
          ],
        ),
      ),
      //Posicion Boton
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //Boton
      floatingActionButton: FloatingActionButton(
        child: const Icon(
            Icons.add), //Icon, widget especializado en mostrar iconos
        onPressed: () {
          print('Hola: $counter');
          counter++;
        },
      ),
    );
  }
}
