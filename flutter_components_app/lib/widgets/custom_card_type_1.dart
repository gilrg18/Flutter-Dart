import 'package:flutter/material.dart';
import 'package:flutter_components_app/themes/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        const ListTile(
          leading: Icon(Icons.photo_album_outlined, color: AppTheme.primary),
          title: Text('Soy un titulo'),
          subtitle: Text(
              'Deserunt do sint sint ut nulla Lorem do in. Ullamco ullamco esse deserunt laborum nostrud tempor magna officia eu consequat. Velit consectetur voluptate Lorem quis consequat ipsum pariatur aliquip nisi cupidatat tempor non.'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Ok'),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
