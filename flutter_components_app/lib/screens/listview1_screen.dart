import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  final animes = const ['AoT', 'DoS', 'Naruto', 'DBZ'];

  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Listview Tipo 1')),
        ),
        body: ListView(
          children: [
            ...animes
                .map((anime) => ListTile(
                      title: Text(anime),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    ))
                .toList(),
            //Divider: linea separadora
            Divider(),
          ],
        ));
  }
}
