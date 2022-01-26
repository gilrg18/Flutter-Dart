//widget independiente

import 'package:flutter/material.dart';

//StatelessWidget es el que crea y establece que la clase sea un widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Center es otro widget
    return const Center(
      //Text es otro widget
      child: Text('Home Screen'),
    );
  }
}
