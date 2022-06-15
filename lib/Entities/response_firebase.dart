import 'package:flutter_poo_api/Entities/registros.dart';

class ResponseFirebase{
  List<Registros>? registros;

  ResponseFirebase(
    {
      this.registros
    }
  );

  // ResponseFirebase.fromJson(Map<String, dynamic> json) {
  //   if (json['Registros'] !=null ){
  //     registros = <Registros>[];
  //     json['Registros'].forEach((v){
  //       registros!.add(Registros.fromJson(v));
  //     });
  //   }
  // }

  // factory ResponseFirebase.fromJson(List<dynamic> json) => ResponseFirebase(
  //   registros: json.map((e) => Registros.fromJson(e)).toList(),
  // );
  ResponseFirebase.fromJson(List<dynamic> variableprueba) {
    registros = variableprueba.map((e) => Registros.fromJson(e)).toList();
   
  }

}