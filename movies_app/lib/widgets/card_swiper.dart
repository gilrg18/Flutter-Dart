import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //todo el ancho posible basado en el padre
      height: 500,
      color: Colors.red,
    );
  }
}
