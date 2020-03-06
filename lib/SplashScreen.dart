import 'dart:async';
import 'package:flutter/material.dart';
import 'package:manausacessivel/Home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_)=>Home()
          )
        ); 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff0066cc),
        padding: EdgeInsets.all(60),
        child: Center(
          child: Image.asset("images/logo.png"),
        ),
      ),
    );
  }
}
