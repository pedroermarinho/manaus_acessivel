import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Infor extends StatefulWidget {
  Map<String,dynamic> data;
  
  Infor(this.data);

  @override
  _InforState createState() => _InforState();
}

class _InforState extends State<Infor> {

  List<Widget> iconsAss(){
    List<Widget> children = List();
    
    if(widget.data["dm"]){
      children.add(
        FaIcon(
          FontAwesomeIcons.accessibleIcon,
          size: 50,
          )
      );
    }
    if(widget.data["dv"]){
      children.add(
        FaIcon(
          FontAwesomeIcons.blind,
          size: 50,
          )
      );
    }
    if(widget.data["da"]){
      children.add(
        FaIcon(
          FontAwesomeIcons.signLanguage,
          size: 50,
          )
      );
    }
    if(widget.data["di"]){
      children.add(
        FaIcon(
          FontAwesomeIcons.brain,
          size: 50,
          )
      );
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(15) ,
        child: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            Padding(
              padding:EdgeInsets.only(top: 15,bottom: 20
              ),
              child:Center( 
                child: Text(
                  "${widget.data["title"]}",
                  style: TextStyle(
                    fontSize: 30
                    ),
                    textAlign: TextAlign.center,
                  ),
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: iconsAss(),
            ),
            Padding(
              padding:EdgeInsets.only(top: 20,bottom: 10),
              child:Center( 
                child: Text(
                  "${widget.data["info"]}",
                  style: TextStyle(
                    fontSize: 20
                    ),
                    textAlign: TextAlign.justify,
                  ),
              )
            )
            
          ],
        ),
        )
      ),
    );
  }
}