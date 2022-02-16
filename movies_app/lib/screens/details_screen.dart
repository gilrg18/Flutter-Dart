import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  //key - manera para identificar este widget en el arbol de widgets de manera independiente o especifica
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text('Details Screen'),
        ),
      ),
    );
  }
}
