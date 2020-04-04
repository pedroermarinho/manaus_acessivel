import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:manausacessivel/app/components/google_map_custom/google_map_custom_controller.dart';

class GoogleMapCustomWidget extends StatelessWidget {
  final GoogleMapCustomController controller =
      Modular.get<GoogleMapCustomController>();

  final bool onMapCreated;

  GoogleMapCustomWidget({Key key, this.onMapCreated = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Observer(builder: (_) {
      return
        controller.cameraPosition==null
        ? Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.black,
            ))
          :
        GoogleMap(
              onTap: controller.setLatLngActual,
              mapType: MapType.normal,
              initialCameraPosition: controller.cameraPosition,
              onMapCreated: onMapCreated ? controller.onMapCreated : null,
              markers: controller.markers.values.toSet(),
              mapToolbarEnabled: false,
              myLocationEnabled: false,
              compassEnabled: false,
              myLocationButtonEnabled: false,
            );
    });
  }
}
