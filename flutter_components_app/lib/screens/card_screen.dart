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
              CustomCardType2(
                  imageUrl:
                      'https://images.indianexpress.com/2021/06/big-tree-pixabay.jpg',
                  name: 'Hello'),
              SizedBox(height: 10),
              CustomCardType2(
                imageUrl:
                    'https://m.economictimes.com/thumb/msid-76635786,width-1200,height-900,resizemode-4,imgsize-867159/1.jpg',
              ),
              SizedBox(height: 10),
              CustomCardType2(
                  imageUrl:
                      'https://www.thespruce.com/thmb/YRvBiS4pVDq5Wh9JhVBX4YIIJnY=/4018x2679/filters:no_upscale():max_bytes(150000):strip_icc()/the-difference-between-trees-and-shrubs-3269804-01-686e6c92f4bd47e197475d2e58e16149.jpg',
                  name: 'Cool tree hehe'),
              SizedBox(height: 1000),
              CustomCardType2(
                imageUrl:
                    'https://assets.landscapeontario.com/assets/1580495345.tree-trunk-forest-web.jpg',
              )
            ]));
  }
}
