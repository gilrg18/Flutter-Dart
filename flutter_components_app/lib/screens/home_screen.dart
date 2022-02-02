import 'package:flutter/material.dart';
import 'package:flutter_components_app/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Flutter Components')),
          elevation: 0,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.access_time_outlined),
                title: const Text('Route name'),
                onTap: () {
                  // final route = MaterialPageRoute(
                  //     builder: (context) => const Listview1Screen());
                  // Navigator.push(context, route);

                  Navigator.pushNamed(context, 'card');
                }),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: 10));
  }
}
