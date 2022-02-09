import 'package:flutter/material.dart';
import 'package:flutter_components_app/themes/app_theme.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 30,
        shadowColor: AppTheme.primary.withOpacity(.5),
        child: Column(
          children: [
            const FadeInImage(
              image: NetworkImage(
                  'https://images.indianexpress.com/2021/06/big-tree-pixabay.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover, //para que la imagen se adapte a su widget
              fadeInDuration: Duration(milliseconds: 300),
            ),
            Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                child: Text('Lorem ipsum xdxd'))
          ],
        ));
  }
}
