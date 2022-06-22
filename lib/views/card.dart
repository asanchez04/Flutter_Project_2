import 'package:flutter/material.dart';
import 'package:flutter_poo_api/views/view_profile.dart';


class CustomCard2 extends StatelessWidget {
  final List lista;
  final int index;

  CustomCard2({Key? key, required this.lista, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registry = lista[index];

    return Center(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 4, 171, 249),
                  minRadius: 40.0,
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(registry.image!),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
            Column(
              children: const [
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            Flexible(
                child: Column(
              children: [
                ListTile(
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.navigate_next,
                      size: 20,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      print(registry.nombre!);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileView(
                                    registry: registry,
                                  )));
                    },
                  ),
                  title: Text(
                      '${registry.nombre!} ${registry.apellido!}'),
                  subtitle: Text(
                    '${registry.carro!.marca} ${registry.carro!.modelo} ',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}