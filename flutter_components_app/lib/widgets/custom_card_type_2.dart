import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: Column(
          children: const [
            FadeInImage(
              image: NetworkImage(
                  'https://images.indianexpress.com/2021/06/big-tree-pixabay.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
            )
          ],
        ));
  }
}
