import 'package:flutter/material.dart';
import '../Entities/registros.dart';
import '../domain/firebase_connection.dart';
import 'card.dart';

class ServicesList extends StatefulWidget {
  const ServicesList({Key? key}) : super(key: key);

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  final dbConnection = FirebaseConnection();
  List<Registros> list_registros = [];

  @override
  Widget build(BuildContext context) {
    fetchInfo();
    return Scaffold(
        backgroundColor: const Color.fromARGB(234, 186, 221, 250),
        appBar: AppBar(
            title: const Center(
          child: Text('Lista de datos de la db'),
        )),
        body: Center(
          child: listData(),
        ));
  }

  Widget listData() {
    return ListView.builder(
      itemCount: list_registros.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomCard2(index: index, lista: list_registros);
      },
    );
  }

  fetchInfo() async {
    final getElements = await dbConnection.getAllRegistros();
    if (list_registros.isEmpty) {
      setState(() {
        list_registros = getElements.registros!;
      });
    }
  }
}