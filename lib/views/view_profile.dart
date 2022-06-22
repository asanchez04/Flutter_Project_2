import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';

import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final registry;
  ProfileView({Key? key, this.registry}) : super(key: key);
  static Map<String, dynamic> profileData = {
    "name": 'No name',
    "lastname": 'No LastName',
    "img": 'http://i.imgur.com/DrAgTNj.png',
    "tel": '1233434',
  };

  @override
  Widget build(BuildContext context) {
    List<String> userPhones = [registry!.cel.toString()];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(child: Text("Perfil de usuario")),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  '${registry.nombre!} ${registry.apellido!}',
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 104, 102, 102),
                minRadius: 60.0,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(registry.image!),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 222, 238, 223),
                minRadius: 35.0,
                child: IconButton(
                  icon: const Icon(
                    Icons.call,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    await FlutterPhoneDirectCaller.callNumber(
                        registry!.cel!.toString());
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 222, 238, 223),
                minRadius: 35.0,
                child: IconButton(
                  icon: const Icon(
                    Icons.message,
                    size: 30.0,
                  ),
                  onPressed: () {
                    _smsToClient(userPhones);
                  },
                ),
              ),
            ],
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: SizedBox(
              width: 370,
              height: 100,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Detalles del Cliente",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "Licencia de conduccion # ${registry.licencia!}"),
                      Text("Numero de contacto # ${registry.cel.toString()}"),
                    ]),
              ),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: SizedBox(
              width: 370,
              height: 100,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Detalles del vehiculo",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "Vehiculo ${registry.carro!.marca} - ${registry.carro!.color} del año ${registry.carro!.modelo}"),
                      Text("Placa # ${registry.carro!.placa} de Colombia"),
                    ]),
              ),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: SizedBox(
              width: 370,
              height: 100,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Servicios solicitados",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Tapizado # ${registry.servicio!.tapiceria}"),
                      Text("Pulido # ${registry.servicio!.polish}"),
                      Text("Lavado # ${registry.servicio!.lavado}"),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _smsToClient(List<String> recipents) async {
    String _result =
        await sendSMS(message: 'Servicio finalizado', recipients: recipents)
            .catchError((err) {
      print(err);
    });
    print(_result);
  }
}