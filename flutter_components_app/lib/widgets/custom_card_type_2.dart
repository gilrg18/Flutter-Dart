import 'package:flutter/material.dart';
import 'package:flutter_components_app/themes/app_theme.dart';

class CustomCardType2 extends StatelessWidget {
  final String imageUrl;
  final String? name;

  const CustomCardType2({Key? key, required this.imageUrl, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 30,
        shadowColor: AppTheme.primary.withOpacity(.5),
        child: Column(
          children: [
            FadeInImage(
              image: NetworkImage(imageUrl),
              placeholder: const AssetImage('assets/jar-loading.gif'),
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover, //para que la imagen se adapte a su widget
              fadeInDuration: const Duration(milliseconds: 300),
            ),

            //conditional inside array
            if (name != null)
              Container(
                  alignment: AlignmentDirectional.centerEnd,
                  padding:
                      const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                  // child: Text(name ?? 'Texto Default (Sin titulo)'))
                  child: Text(name!))
          ],
        ));
  }
}
