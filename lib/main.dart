import 'package:flutter/material.dart';
import 'package:manausacessivel/Home.dart';
import 'package:manausacessivel/controller/carregarDados.dart';
import 'dart:async';
void main() => runApp(
  MaterialApp(
    title: "Manaus Acessível",
    home: Home(),
  )
);

// void main() async{
//   runApp(
//     MaterialApp(
//       title: "Manaus Acessível",
//       home: Home(),
//     )
//   );

  // for(var data in await carregarDadosMarcadores()){
  //   print(data["title"]);
  //   print(data["id"]);
  //   print(data["type"]);
  //   print(data["icon"]);
  //   print(data["latitude"]);
  //   print(data["longitude"]);
  //   print(data["dm"]);
  //   print(data["dv"]);
  //   print(data["da"]);
  //   print(data["di"]);
  // }
// }
