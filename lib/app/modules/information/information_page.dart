import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
          PopupMenuButton<String>(
            onSelected: controller.selectionMenuItem,
            itemBuilder: (context) {
              return controller.itemsMenu.map((String item) {
                return PopupMenuItem<String>(value: item, child: Text(item));
              }).toList();
            },
          )
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
                          padding: EdgeInsets.only(top: 20, bottom: 10),
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
                                        Text(
                                          "Cidade: ${controller.placemark.subAdministrativeArea}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        Text(
                                          "Bairro: ${controller.placemark.subLocality}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        Text(
                                          "Rua: ${controller.placemark.thoroughfare}, ${controller.placemark.subThoroughfare}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        Text(
                                          "Cep: ${controller.placemark.postalCode}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
