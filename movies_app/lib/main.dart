import 'package:flutter/material.dart';
import 'package:movies_app/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies App',
        initialRoute: 'home',
        routes: {
          //An underscore (_) is usually an indication that you
          //will not be using this parameter within the block.
          //This is just a neat way to write code.
          'home': (_) => HomeScreen(),
          'details': (_) => DetailsScreen(),
        });
  }
}
