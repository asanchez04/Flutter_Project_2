import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';

import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  static Map<String, dynamic> UserData = {
    "name": 'Alan',
    "lastname": 'Sanchez',
    "img": 'https://i.ytimg.com/vi/udI_06vEmZQ/mqdefault.jpg',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 167, 201, 216),
        title: const Center(child: Text("User view")),
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
                  '${UserData["name"]} ${UserData["lastname"]}',
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
                backgroundColor: Color.fromARGB(255, 104, 102, 102),
                minRadius: 60.0,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(UserData["img"]),
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
                    await FlutterPhoneDirectCaller.callNumber('+573007695261');
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
                    notifyService(['+573122969686']);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void notifyService(List<String> client) async {
    String _result =
        await sendSMS(message: 'Su vehiculo ya esta ready', recipients: client)
            .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
}