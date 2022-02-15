import 'package:flutter/material.dart';

//ctrl shift l, to select and replace all
class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  //dos pasos del ciclo de vida de un statefull widget:
  //initState: cuando se crea por primera y unica vez:
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      // print(
      //     ' ${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent} ');
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        add5();
      }
    });
  }

  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          controller: scrollController,
          itemCount: imagesIds.length,
          itemBuilder: (BuildContext context, int index) {
            return FadeInImage(
              width: double.infinity, //toma todo el ancho posible
              height: 300,
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://picsum.photos/500/300?image=${imagesIds[index]}'),
            );
          },
        ),
      ),
    );
  }
}
