import 'dart:convert';

import 'package:api_flutterv2/models/lugar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LugaresService extends ChangeNotifier {
  final String baseUrl = 'https://actividad8-d213f-default-rtdb.firebaseio.com';
  final List<Lugar> lugares = [];
  late Lugar seleccionarLugar;

  bool isLoading = true;
  bool isSaving = false;

  LugaresService() {
    listarLugares();
  }

  //LISTAR LUGARES
  Future<List<Lugar>> listarLugares() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse('$baseUrl/lugar.json');
    final response = await http.get(url);

    final Map<String, dynamic> lugaresMap = json.decode(response.body);

    lugaresMap.forEach((key, value) {
      final lugarTemporal = Lugar.fromMap(value);
      lugarTemporal.id = key;
      lugares.add(lugarTemporal);
    });

    isLoading = false;
    notifyListeners();
    return lugares;
  }

  //VALIDAR
  Future crearOactualizar(Lugar lugar) async {
    isSaving = true;
    notifyListeners();

    if (lugar.id == null) {
      await crearLugar(lugar);
    } else {
      await actualizarLugar(lugar);
    }

    isSaving = false;
    notifyListeners();
  }

  //ACTUALIZAR LUGAR
  Future actualizarLugar(Lugar lugar) async {
    final url = Uri.parse('$baseUrl/lugar/${lugar.id}.json');
    final response = await http.put(url, body: lugar.toJson());
    final decodedData = response.body;
    print(decodedData);
    final index = lugares.indexWhere((element) => element.id == lugar.id);
    lugares[index] = lugar;
    return lugar.id;
  }

  //CREAR LUGAR
  Future<String> crearLugar(Lugar lugar) async {
    final url = Uri.parse('$baseUrl/lugar.json');
    final response = await http.post(url, body: lugar.toJson());
    final decodedData = json.decode(response.body);
    lugar.id = decodedData['name'];

    lugares.add(lugar);
    return lugar.id!;
  }

  //BORRAR LUGAR
  Future<String> borrarLugar(Lugar lugar) async {
    final url = Uri.parse('$baseUrl/lugar/${lugar.id}.json');
    final response = await http.delete(url);
    return lugar.id!;
  }
}
