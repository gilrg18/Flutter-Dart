import 'package:flutter/material.dart';
import 'package:flutter_components_app/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Card Widget')),
        ),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            children: const [
              CustomCardType1(),
              SizedBox(height: 10),
              CustomCardType2()
            ]));
  }
}
