import 'package:flutter/material.dart';
import 'package:flutter_components_app/themes/app_theme.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Card Widget')),
        ),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            children: [
              Card(
                child: Column(children: const [
                  ListTile(
                    leading: Icon(Icons.photo_album_outlined,
                        color: AppTheme.primary),
                    title: Text('Soy un titulo'),
                    subtitle: Text(
                        'Deserunt do sint sint ut nulla Lorem do in. Ullamco ullamco esse deserunt laborum nostrud tempor magna officia eu consequat. Velit consectetur voluptate Lorem quis consequat ipsum pariatur aliquip nisi cupidatat tempor non.'),
                  )
                ]),
              )
            ]));
  }
}
