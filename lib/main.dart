import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_poo_api/views/Splash.dart';
// import 'package:flutter_poo_api/views/listview_1.dart';
import 'package:flutter_poo_api/views/vista_firebase.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Splash()
    );
  }
}

// void callDatabase(){

//   DatabaseReference starCountRef =
//     FirebaseDatabase.instance.ref('/registros/Registros/232610');
//   starCountRef.onValue.listen((event){
//     final data = event.snapshot.value;
//     print(data.toString());

//   });

// }
