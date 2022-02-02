import 'package:flutter/material.dart';
import 'package:flutter_components_app/router/app_routes.dart';
import 'package:flutter_components_app/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData.light().copyWith(
          //Color primario
          primaryColor: Colors.indigo,
          //AppBar Theme
          appBarTheme: const AppBarTheme(color: Colors.indigo, elevation: 0)),
    );
  }
}
