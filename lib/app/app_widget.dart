import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Manaus Acessível',
      theme: ThemeData(
          primaryColor: Color(0xff181818), accentColor: Color(0xffBBBCBC)),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
