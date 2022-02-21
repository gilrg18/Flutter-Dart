import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  //key - manera para identificar este widget en el arbol de widgets de manera independiente o especifica
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar luego por una instancia de movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //slivers: como un appbar pero se mueve con el scroll
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//_ privado, solo se va a usar dentro de este archivo
class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          //cliprrect para poder poner un borderradius
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage('https://via.placeholder.com/200x300'),
            height: 200,
          ),
        ),
        const SizedBox(width: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, //alinear los textos
          children: [
            Text('movie.title',
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
            Text('movie.originalTitle',
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 1),
            Row(
              children: [
                const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                const SizedBox(width: 5),
                Text('movie.voteAverage', style: textTheme.caption),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
