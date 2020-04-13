import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/information/components/stars_icon/stars_icon_widget.dart';

import 'information_controller.dart';

class InformationPage extends StatefulWidget {
  final String title;

  const InformationPage({Key key, this.title = "Information"})
      : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState
    extends ModularState<InformationPage, InformationController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações"),
        actions: <Widget>[
          Observer(builder: (_) {
            return IconButton(
              icon: Icon(controller.favorite == null
                  ? Icons.favorite_border
                  : Icons.favorite),
              onPressed: controller.favorite == null
                  ? controller.saveFavoriteMarker
                  : controller.deleteFavoriteMarker,
            );
          }),
          PopupMenuButton<String>(
            onSelected: controller.selectionMenuItem,
            itemBuilder: (context) {
              return controller.itemsMenu.map((String item) {
                return PopupMenuItem<String>(value: item, child: Text(item));
              }).toList();
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return controller.marker == null || controller.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 20),
                          child: Center(
                            child: Observer(
                              builder: (_) {
                                return Text(
                                  "${controller.marker.title}",
                                  style: TextStyle(fontSize: 30),
                                  textAlign: TextAlign.center,
                                );
                              },
                            ),
                          ),
                        ),
                        Observer(
                          builder: (_) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: controller.iconsAssList.toList(),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 10),
                          child: Center(
                            child: Observer(
                              builder: (_) {
                                return Text(
                                  "${controller.marker.description}",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.justify,
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, bottom: 10, left: 20),
                          child: Observer(
                            builder: (_) {
                              return controller.placemark == null
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              "Cidade:",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black87,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              "${controller.placemark.subAdministrativeArea}",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black54,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              "Bairro:",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black87,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              "${controller.placemark.subLocality}",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black54,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              "Rua:",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black87,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              "${controller.placemark.thoroughfare}, ${controller.placemark.subThoroughfare}",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black54,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              "Cep:",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black87,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              "${controller.placemark.postalCode}",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black54,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(),
                          child: StarsIconWidget(
                            star1: controller.star1,
                            star2: controller.star2,
                            star3: controller.star3,
                            star4: controller.star4,
                            star5: controller.star5,
                            function: controller.salveStars,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 20,top: 5,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Media de Estrelas: ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(controller.media.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          child: Observer(
                            builder: (_) {
                              return controller.userMarker == null
                                  ? Container()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Criado por:",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundColor:
                                                  Color(0xffe6c131),
                                              backgroundImage: NetworkImage(
                                                  controller
                                                      .userMarker.pathPhoto),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: Text(
                                                controller.userMarker.name,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    );
                            },
                          ),
                        ),
//                        Padding(
//                          padding: EdgeInsets.only(top: 15),
//                          child: CommentsWidget(),
//                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
