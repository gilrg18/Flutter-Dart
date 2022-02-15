import 'package:flutter/material.dart';
import 'package:flutter_components_app/themes/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Siders & Checks'),
      ),
      //singlechildscrollview: cuando la imagen no quepa en la pantalla
      //verticalmente, me va a permitir hacer scroll
      body: SingleChildScrollView(
        child: Column(
          children: [
            Slider(
              min: 50,
              max: 500,
              value: _sliderValue,
              divisions: 10,
              activeColor: AppTheme.primary,
              onChanged: (value) {
                //we need to redraw the widget on change
                //change statelesswidget to stateful
                //print(value);
                _sliderValue = value;
                setState(() {});
              },
            ),
            Image(
              image: const NetworkImage(
                  'https://elcomercio.pe/resizer/bhbWkBdAITxpJXZTOdIoT1-q2is=/1200x1200/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/BSIPV333VJCDPB625ZKXNQWMZ4.jpg'),
              fit: BoxFit.contain,
              width: _sliderValue,
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
