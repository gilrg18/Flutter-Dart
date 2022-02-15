import 'package:flutter/material.dart';
import 'package:flutter_components_app/themes/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Siders & Checks'),
      ),
      body: Column(
        children: [
          Slider(
            min: 50,
            max: 500,
            value: _sliderValue,
            divisions: 10,
            activeColor: AppTheme.primary,
            onChanged: _sliderEnabled
                ? (value) {
                    _sliderValue = value;
                    setState(() {});
                  }
                : null,
          ),
          // Checkbox(
          //   value: _sliderEnabled,
          //   onChanged: (value) {
          //     _sliderEnabled = value ?? true;
          //     setState(() {});
          //   },
          // ),
          CheckboxListTile(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar slider'),
            value: _sliderEnabled,
            onChanged: (value) {
              _sliderEnabled = value ?? true;
              setState(() {});
            },
          ),
          // Switch(
          //   value: _sliderEnabled,
          //   onChanged: (value) {
          //     _sliderEnabled = value;
          //     setState(() {});
          //   },
          // ),
          //.adaptive para que se adapte a ios/android
          SwitchListTile.adaptive(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar slider'),
            value: _sliderEnabled,
            onChanged: (value) {
              _sliderEnabled = value;
              setState(() {});
            },
          ),

          const AboutListTile(), //licencias
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage(
                    'https://elcomercio.pe/resizer/bhbWkBdAITxpJXZTOdIoT1-q2is=/1200x1200/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/BSIPV333VJCDPB625ZKXNQWMZ4.jpg'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
