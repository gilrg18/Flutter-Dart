import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              // style: ElevatedButton.styleFrom(
              //     primary: Colors.indigo,
              //     shape: const StadiumBorder(),
              //     elevation: 5),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Mostrar Alerta', style: TextStyle(fontSize: 20)),
              ))),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
