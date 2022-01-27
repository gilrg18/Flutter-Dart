import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  //propiedad counter
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter Screen')),
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Clicks Counter', style: fontSize30),
            Text('$counter', style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () {
              counter--;
              //setState(funcion anonima), setState(()=>{})
              //setState notifica que hubo un cambio interno en el estado,
              //lo cual manda a redibujar el widget
              setState(() {});
            },
          ),
          //SizedBox: widget auxiliar para hacer espacio entre widgets
          // const SizedBox(
          //   width: 30,
          // ),
          FloatingActionButton(
            child: const Icon(Icons.restore_sharp),
            onPressed: () {
              counter = 0;
              setState(() {});
            },
          ),
          // const SizedBox(
          //   width: 30,
          // ),
          FloatingActionButton(
            child: const Icon(Icons.exposure_plus_1),
            onPressed: () {
              counter++;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
