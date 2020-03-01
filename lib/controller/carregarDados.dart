import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

Future<String> _carregaMarcadoresJson() async {
  return await rootBundle.loadString('json/marcadores.json');
}

Future<List<dynamic>> carregarDadosMarcadores() async {
  String jsonString = await _carregaMarcadoresJson();
  final List<dynamic> jsonListResponse = json.decode(jsonString);
  return jsonListResponse;
}
