import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manausacessivel/app/components/google_map_custom/google_map_custom_widget.dart';
import 'package:manausacessivel/app/components/sidebar/sidebar_widget.dart';
import 'package:manausacessivel/app/modules/home/components/show_markers_list/show_markers_list_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller


  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            GoogleMapCustomWidget(),
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
//                  height: ,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffe6c131),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white),
                  child: Observer(
                    builder: (_) {
                      return Column(
                        children: <Widget>[
                          TextField(
//                           readOnly: true,
                          autofocus: false,
                            onSubmitted: controller.newLocation,
                            onChanged: controller.isValidAddress,
                            keyboardType: TextInputType.url,
                            decoration: InputDecoration(
                              icon: Container(
                                margin: EdgeInsets.only(left: 20, bottom: 15),
                                width: 10,
                                height: 10,
                                child: Icon(
                                  Icons.location_on,
                                  color: Color(0xffe6c131),
                                ),
                              ),
                              hintText: "Meu local",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                left: 15,
                              ),
                            ),
                          ),
                          controller.listWidgetOptionsAddress.isNotEmpty
                              ? Column(
                                  children: controller.listWidgetOptionsAddress
                                      .toList(),
                                )
                              : Container(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 10,
              right: 10,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffe6c131), width: 2),
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      iconSize: 35,
                      icon: Icon(
                        Icons.favorite,
                      ),
                      color: Colors.black,
                      onPressed: null,
                    ),
                    IconButton(
                      iconSize: 35,
                      icon: Icon(
                        Icons.accessible,
                      ),
                      color: Colors.black,
                      onPressed: (){
                        ShowMarkersListWidget(context);
                      },
                    ),
                    Container(),
                   IconButton(
                        iconSize: 35,
                        icon: Icon(
                          Icons.map,
                        ),
                        color: Colors.black,
                        onPressed:controller.openMap,
                      ),

                    IconButton(
                      iconSize: 35,
                      padding: EdgeInsets.only(),
                      icon: Icon(
                        Icons.my_location,
                      ),
                      color: Colors.black,
                      onPressed:  controller.recoverLocatingActual,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 90,
              left: 10,
              right: 10,
              child: IconButton(
                icon: Icon(
                  Icons.add_location,
                  size: 90,
                ),
                onPressed: controller.createNewMarker,
              ),
            ),
            Positioned(
              top: 150,
              right: 22,
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.compass,
                  size: 40,
                ),
                onPressed: controller.compassMap,
              ),
            ),
            SidebarWidget(),
          ],
        ),
      ),
    );
  }
}
