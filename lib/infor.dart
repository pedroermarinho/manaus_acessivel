import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Infor extends StatefulWidget {
  Map<String,dynamic> data;
  
  Infor(this.data);

  @override
  _InforState createState() => _InforState();
}

class _InforState extends State<Infor> {
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
              children: <Widget>[   
                Visibility(
                  child: FaIcon(
                    FontAwesomeIcons.accessibleIcon,
                    size: 50,
                    ),
                    visible: widget.data["dm"] ,
                  ),
                  Visibility(
                  child: FaIcon(
                    FontAwesomeIcons.blind,
                    size: 50,
                    ),
                    visible: widget.data["dv"] ,
                  ),
                  Visibility(
                  child: FaIcon(
                    FontAwesomeIcons.signLanguage,
                    size: 50,
                    ),
                    visible: widget.data["da"] ,
                  ),
                  Visibility(
                  child: FaIcon(
                    FontAwesomeIcons.brain,
                    size: 50,
                    ),
                    visible: widget.data["di"] ,
                  ),
                  
                
              ],
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