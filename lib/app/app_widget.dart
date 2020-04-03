import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Manaus Acessível',
      theme: ThemeData(
        primaryColor: Color(0xff181818),
        accentColor: Color(0xffBBBCBC),
        backgroundColor: Color(0xffefeeec),
        appBarTheme: AppBarTheme(
          color: Colors.black,
          iconTheme: IconThemeData(
            color: Color(0xffe6c131),
          )
        ),
        accentIconTheme: IconThemeData(
          color: Color(0xffe6c131),
        ),
        iconTheme: IconThemeData(
          color: Color(0xffe6c131),
        ),

      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
