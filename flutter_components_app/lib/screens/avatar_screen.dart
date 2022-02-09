import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Gilberto Rogel')),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: const Text('GR'),
              backgroundColor: Colors.indigo[900],
            ),
          ),
        ],
      ),
      body: const Center(
        child: CircleAvatar(
          maxRadius: 150,
          backgroundImage: NetworkImage(
              'https://i1.wp.com/www.senpai.com.mx/wp-content/uploads/2021/07/Nuevas-imagenes-de-Kimetsu-no-Yaiba-celebran-el-cumpleanos-de-Tanjiro-Kamado.jpg?resize=1280%2C720&ssl=1'),
        ),
      ),
    );
  }
}
