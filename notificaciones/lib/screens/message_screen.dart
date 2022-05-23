import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    print('args $args');
    print(args.runtimeType);
    print(args.entries);
    if (args["product"] != null) {
      final product = args["product"];
    }
    if (args["precio"] != null) {
      final product = args["precio"];
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
      ),
      body: Center(
        child: Text(
            (args["product"] == null ? 'No data' : '${args["product"]}') +
                '\n${args["precio"] == null ? 'No data' : '\$${args["precio"]}'}',
            style: const TextStyle(fontSize: 30)),
      ),
      // body: ListView.separated(
      //     itemBuilder: (context, index) => Center(
      //           child: Text(args["product"] + ' \$${args["precio"]}',
      //               style: const TextStyle(fontSize: 30)),

      //           // child: ListTile(
      //           //     title: Text(args["product"]),
      //           //     subtitle: Text('\$${args["precio"]}'),
      //           //     trailing: const Icon(Icons.notifications)),
      //         ),
      //     //se pone guion bajo cuando no se utiliza el argumento, dos __ para el segundo argumento
      //     separatorBuilder: (_, __) => const Divider(),
      //     itemCount: args.length),
    );
  }
}
