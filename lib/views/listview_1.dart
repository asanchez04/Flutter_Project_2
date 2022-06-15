import 'package:flutter/material.dart';

class ListView1 extends StatelessWidget {
   
  ListView1({Key? key}) : super(key: key);
  
    final List<Map<String, String>> _anime = [

      {
        "img": "https://areajugones.sport.es/wp-content/uploads/2021/12/kimetsu-no-yaiba-anime-libro-de-arte-1.jpg",
        "name": "Kimetsu"
      },
      {
        "img": "https://as01.epimg.net/meristation/imagenes/2022/06/03/noticias/1654272127_029049_1654272544_noticia_normal.jpg",
        "name": "One Piece"
      },
      {
        "img": "https://alfabetajuega.com/hero/2022/02/Naruto-reddit-ilustracion-naruto-kurama-principal.jpg?width=1200&aspect_ratio=1200:631",
        "name": "Naruto"
      },
      {
        "img": "https://www.justwatch.com/images/backdrop/4006917/s640/gintama",
        "name": "Gintama"
      },
      {
        "img": "https://images.justwatch.com/backdrop/182870100/s640/hunter-x-hunter-2011",
        "name": "HunterxHunter"
      },
      {
        "img": "https://images.justwatch.com/backdrop/182870100/s640/hunter-x-hunter-2011",
        "name": "HunterxHunter"
      },
      {
        "img": "https://images.justwatch.com/backdrop/182870100/s640/hunter-x-hunter-2011",
        "name": "HunterxHunter"
      },
      {
        "img": "https://images.justwatch.com/backdrop/182870100/s640/hunter-x-hunter-2011",
        "name": "HunterxHunter"
      },
      {
        "img": "https://images.justwatch.com/backdrop/182870100/s640/hunter-x-hunter-2011",
        "name": "HunterxHunter"
      },
      {
        "img": "https://images.justwatch.com/backdrop/182870100/s640/hunter-x-hunter-2011",
        "name": "HunterxHunter"
      },
    ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime'),
      ),
      body: ListView.builder(
        itemCount: _anime.length,
        itemBuilder: (_, index){
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: Image.network(_anime[index]["img"]!).image,
            ),
            title: Text(_anime[index]["name"]!),
            onTap: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('AlertDialog description'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        )
          );
        }
      )
    );
  }
}