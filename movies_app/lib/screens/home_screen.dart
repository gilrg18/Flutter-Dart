import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  //key - manera para identificar este widget en el arbol de widgets de manera independiente o especifica
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Películas en cines')),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              //Tarjetas principales
              CardSwiper(),

              //Slider de peliculas
              MovieSlider(),
            ],
          ),
        ));
  }
}
