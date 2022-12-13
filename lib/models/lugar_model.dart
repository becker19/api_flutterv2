import 'dart:convert';

class Lugar {
  String descripcion;
  String nombre;
  String? id;

  Lugar({
    required this.descripcion,
    required this.nombre,
    this.id,
  });

  factory Lugar.fromJson(String str) => Lugar.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lugar.fromMap(Map<String, dynamic> json) => Lugar(
        descripcion: json["descripcion"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "nombre": nombre,
      };

  Lugar copyWith() => Lugar(
        descripcion: descripcion,
        nombre: nombre,
        id: id,
      );
}
