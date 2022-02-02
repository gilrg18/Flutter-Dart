import 'package:flutter/material.dart';
import 'package:flutter_components_app/router/app_routes.dart';
import 'package:flutter_components_app/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //se le quita la constante para que el mapa del route listview1
    //pueda crearse en tiempo de ejecucion para definir las rutas
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
