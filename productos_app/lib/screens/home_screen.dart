import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Productos')),
      ),
      //listView.builder, crea los widgets cuando esten cerca de entrar a la pantalla
      //y no los va a mantener todos activos si no estan en pantalla

      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                //GestureDetector para cuando le piques a cada tarjeta te muestre la pantalla con detalles
                onTap: () => Navigator.pushNamed(context, 'product'),
                child: const ProductCard(),
              )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
