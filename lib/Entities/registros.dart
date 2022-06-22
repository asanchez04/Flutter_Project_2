import 'package:flutter_poo_api/Entities/carro.dart';
import 'package:flutter_poo_api/Entities/servicio.dart';

class Registros{
  Carro? carro;
  Servicio? servicio;
  String? apellido;
  int? cel;
  String? licencia;
  String? nombre;
  String? image;

  Registros(
    {
      this.carro,
      this.servicio,
      this.apellido,
      this.cel,
      this.licencia,
      this.nombre,
      this.image
    }
  );

  factory Registros.fromJson(Map<String, dynamic> json){
    return Registros(
      carro: json['Carro']!= null ? Carro.fromJson(json['Carro']) : null,
      servicio: json['Servicio'] != null ? Servicio.fromJson(json['Servicio']): null,
      apellido: json['apellido'],
      cel: json['cel'],
      licencia: json['licencia'],
      nombre: json['nombre'],
      image: json['image'],
    );
  }

  // factory Registros.fromJson(List<dynamic> json) {
  //   print(json);
  //   return Registros(
  //       carro: json[0] != null ? carro.fromJson(json[0]) : null,
  //       cliente: json[1] != null ? client.fromJson(json[1]) : null,
  //       servicio: json[2] != null ? Servicio.fromJson(json[2]) : null);
  // }
   @override
  String toString() {
    return 'Registros{carro: $carro, servicio: $servicio, apellido: $apellido, cel: $cel, image: $image, licencia: $licencia, nombre: $nombre}';
  }

}