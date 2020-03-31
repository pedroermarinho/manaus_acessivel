import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:manausacessivel/app/components/google_map_custom/google_map_custom_controller.dart';

class GoogleMapCustomWidget extends StatelessWidget {
  final GoogleMapCustomController controller =
      Modular.get<GoogleMapCustomController>();

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Observer(builder: (_) {
      return controller.markers.length < 1
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.black,
            ))
          : GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: controller.cameraPosition,
              onMapCreated: controller.onMapCreated,
              markers: controller.markers.values.toSet(),

//              myLocationEnabled: true,
              // myLocationButtonEnabled: true,
            );
    });
  }
}