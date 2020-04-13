import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/components/google_map_custom/google_map_custom_widget.dart';
import 'package:manausacessivel/app/components/text_field_custom/text_field_custom_widget.dart';
import 'package:manausacessivel/app/models/marker_model.dart';

import 'marker_controller.dart';

class MarkerPage extends StatefulWidget {
  final String title;
  final MarkerModel marker;

  const MarkerPage({Key key, this.title = "Marker", this.marker})
      : super(key: key);

  @override
  _MarkerPageState createState() => _MarkerPageState();
}

class _MarkerPageState extends ModularState<MarkerPage, MarkerController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.setMarker(widget.marker);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Marcador"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: 150,
                    height: 150,
                    child: GoogleMapCustomWidget(
                      onMapCreated: false,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextFieldCustomWidget(
                    controller: TextEditingController(
                        text: controller.marker != null
                            ? controller.marker.title
                            : ""),
                    labelText: "Nome do local",
                    textInputType: TextInputType.text,
                    onChanged: controller.setName,
                    errorText: controller.validateName,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextFieldCustomWidget(
                    controller: TextEditingController(
                        text: controller.marker != null
                            ? controller.marker.description
                            : ""),
                    labelText: "Descrição",
                    textInputType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: controller.setDescrcao,
                    errorText: controller.validateDescription,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white,
                    ),
                    child: Observer(
                      builder: (_) {
                        return DropdownButton(
                          value: controller.selectedMarker,
                          items: controller.dropdownMenuItems.toList(),
                          isExpanded: true,
                          underline: Container(),
                          iconEnabledColor: Colors.black,
                          hint: controller.marker != null
                              ? controller.dropdownMenuValue
                              : Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    "Categoria",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                          focusColor: Colors.black,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          onChanged: controller.setSelectedMarker,
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15, top: 5),
                  child: Text(
                    "Este local é acessível para qual categorias de deficiências?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Observer(
                        builder: (_) {
                          return Switch(
                            value: controller.dm,
                            onChanged: controller.setDm,
                          );
                        },
                      ),
                      Text(
                        "Deficiência Motora",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Observer(
                        builder: (_) {
                          return Switch(
                            value: controller.dv,
                            onChanged: controller.setDv,
                          );
                        },
                      ),
                      Text(
                        "Deficiência Visual",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Observer(
                        builder: (_) {
                          return Switch(
                            value: controller.da,
                            onChanged: controller.setDa,
                          );
                        },
                      ),
                      Text(
                        "Deficiência Auditiva",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Observer(
                        builder: (_) {
                          return Switch(
                            value: controller.di,
                            onChanged: controller.setDi,
                          );
                        },
                      ),
                      Text(
                        "Deficiência Intelectual",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  ),
                ),
                Observer(
                  builder: (_) {
                    return controller.loading
                        ? Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 10),
                            child: Center(
                              child: CircularProgressIndicator(
                                  backgroundColor: Colors.white),
                            ),
                          )
                        : Container();
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Observer(
                    builder: (_) {
                      return Visibility(
                          visible: controller.isValid,
                          child: RaisedButton(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              "Salvar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            color: Colors.black87,
                            onPressed: controller.validCampos,
                          ));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Observer(
                      builder: (_) {
                        return Text(
                          controller.messageError,
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
