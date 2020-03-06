import 'dart:convert';
import 'dart:async' show Future;
import 'package:http/http.dart' as http;
// import 'package:flutter/services.dart' show rootBundle;
// Future<String> _carregaMarcadoresJson() async {
  
//   // return await rootBundle.;
//   return await rootBundle.loadString('json/marcadores.json');
// }

Future<List<dynamic>> carregarDadosMarcadores() async {
  http.Response response = await http.get('https://pedroermarinho.github.io/manaus-acessivel/json/marcadores.json');
  // String jsonString = await _carregaMarcadoresJson();
  final List<dynamic> jsonListResponse = json.decode(response.body);
  return jsonListResponse;
}
