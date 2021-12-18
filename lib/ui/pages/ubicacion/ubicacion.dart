import 'dart:async';

import 'package:Matrix_Game2/domain/controller/auth_controller.dart';
import 'package:Matrix_Game2/domain/controller/firestore_controller.dart';
import 'package:flutter/material.dart';
import 'package:Matrix_Game2/domain/use_case/controllers/location.dart';
import 'package:Matrix_Game2/domain/use_case/controllers/permissions.dart';
import 'package:Matrix_Game2/domain/use_case/location_management.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class GpsScreen extends StatefulWidget {
  const GpsScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

enum RadioState { on, off }

class _State extends State<GpsScreen> {
  late PermissionsController permissionsController;
  late LocationController locationController;
  late LocationManager manager;
  late AuthenticationController authenticationController;

  @override
  void initState() {
    super.initState();
    permissionsController = Get.find();
    locationController = Get.find();
    authenticationController = Get.find();
    manager = LocationManager();
    Timer.periodic(const Duration(seconds: 20), (timer) async {
      locationController.location.value = null;
      if (permissionsController.locationGranted) {
        final position = await manager.getCurrentLocation();
        locationController.location.value = position;
        /*Get.snackbar('Tu ubicación',
            'Latitud ${position.latitude}\nLongitud: ${position.longitude}\nAltitud: ${position.altitude}');*/
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ControllerFirestore2 controlp = Get.find();
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            //BOTON PARA OBTENER LA UBICACION
            child: ElevatedButton(
              onPressed: () async {
                // Verifica que tienes los permisos y luego obten la ubicacion
                // Almacenala y tambien muestra un snackbar con los datos
                locationController.location.value = null;
                if (permissionsController.locationGranted) {
                  final position = await manager.getCurrentLocation();
                  locationController.location.value = position;
                  var ubicacion = <String, dynamic>{
                    'lat': position.latitude,
                    'lo': position.longitude,
                    'name': authenticationController.emailf,
                    'uid': authenticationController.uidf,
                  };
                  print(ubicacion);
                  controlp.guardarubicacion(
                      ubicacion, authenticationController.uidf);
                  /*Get.snackbar('Tu ubicación',
                        'Latitud ${position.position}\nLongitud: ${position.longitude}\nAltitud: ${position.altitude}')*/
                  ;
                }
              },
              child: const Text('Obtener Ubicacion'),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Obx(
              () => ElevatedButton(
                onPressed: locationController.location.value != null
                    ? () async {
                        // Con los datos de ubicacion almacenados construye un enlace a Google Maps
                        // y lanzalo
                        final location = locationController.location.value;
                        final url =
                            "https://www.google.com/maps?q=${location?.latitude},${location?.longitude}";
                        await launch(url);
                      }
                    : null,
                child: const Text('Abrir Maps'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
