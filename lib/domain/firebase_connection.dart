import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import '../Entities/response_firebase.dart';



class FirebaseConnection {
  //devuelve la instancia de la base de datos
  static final FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseReference instanceFirebase() {
    return _database.ref('/registros/Registros');
  }

  /*void getAllRegistros() {
    DatabaseReference _registros = instanceFirebase();
    
    _registros.onValue.listen((event) {
      final registros = event.snapshot.value;
      Map<String, dynamic> registrosJson = json.decode(registros.toString());
      
      ResponseFirebase reg = ResponseFirebase.fromJson(registrosJson);
      print(reg);
    });
  }*/

  Future<ResponseFirebase> getAllRegistros() async {
    try {
      DatabaseReference _registros = instanceFirebase();
      DataSnapshot response = await _registros.get();
      final stringjson = json.encode(response.value);
      final realjson = json.decode(stringjson);
      final registers = ResponseFirebase.fromJson(realjson.values.toList());
      return registers;
    } catch (e) {
      rethrow;
    }

  }
  
}