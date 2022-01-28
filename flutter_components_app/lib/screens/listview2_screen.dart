import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  final animes = const ['Attack on Titan', 'Demon Slayer', 'Naruto', 'DBZ'];

  const Listview2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Listview Tipo 2')),
          elevation: 0,
          backgroundColor: Colors.indigo,
        ),
        //ListView.builder es lo mismo pero no tiene el separatorBuilder:
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(animes[index]),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.indigo,
                  ),
                  onTap: () {
                    final anime = animes[index];
                    print(anime);
                  },
                ),

            //se pone guion bajo cuando no se utiliza el argumento, dos __ para el segundo argumento
            separatorBuilder: (_, __) => const Divider(),
            itemCount: animes.length));
  }
}
