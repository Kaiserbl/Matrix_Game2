import 'dart:math';

import 'package:Matrix_Game2/domain/controller/auth_controller.dart';
import 'package:Matrix_Game2/domain/controller/firestore.dart';
import 'package:Matrix_Game2/domain/controller/image_controller.dart';
import 'package:Matrix_Game2/domain/use_case/controllers/location2.dart';
import 'package:Matrix_Game2/ui/pages/chatprivado/chatprivado_widget.dart';
import 'package:Matrix_Game2/ui/pages/flutter_flow/flutter_flow_theme.dart';
import 'package:Matrix_Game2/ui/pages/perfil/perfil_widget.dart';
import 'package:Matrix_Game2/ui/pages/serweb/serweb_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workmanager/workmanager.dart';

class Locations extends StatefulWidget {
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  ControllerFirestore controlp = Get.find();
  AuthenticationController controluser = Get.find();
  Controllerlocations controlubicacion = Get.find();
  ControllerFirestore controlguardarloc = Get.find();
  Image_Control image = Get.find();

  @override
  void initState() {
    super.initState();
    controlubicacion.obtenerubicacion();
    _initNotificaciones();
    Workmanager().registerPeriodicTask(
      "1",
      "ObtenerUbicacionesPeriodicas",
    );
    /*Timer.periodic(const Duration(minutes: 30), (timer) async {
      // Verifica que tienes los permisos y luego obten la ubicacion
      // Almacenala y tambien muestra un snackbar con los datos
      locationController.location.value = null;
      if (permissionsController.locationGranted) {
        final position = await manager.getCurrentLocation();
        locationController.location.value = position;
        Get.snackbar('Tu ubicación',
            'Latitud ${position.latitude}\nLongitud: ${position.longitude}\nAltitud: ${position.altitude}');
      }
    });*/
  }

  _initNotificaciones() async {
    final _plugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _plugin.initialize(initializationSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: ListTile(
          title: Obx(() => Text(
                'Lat: ${controlubicacion.locationlat} Lon: ${controlubicacion.locationlo}',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'NEXA',
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: false,
                ),
              )),
          subtitle: Text(
            controluser.uidf,
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'NEXA',
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              useGoogleFonts: false,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                controlubicacion.obtenerubicacion();
                var ubicacion = <String, dynamic>{
                  'lat': controlubicacion.locationlat,
                  'lo': controlubicacion.locationlo,
                  'name': controluser.emailf,
                  'uid': controluser.uidf,
                };
                controlguardarloc.guardarubicacion(ubicacion, controluser.uidf);

                displayNotification(
                    title: 'Cerca de Mi',
                    body:
                        '${controlubicacion.cercanos}  Amigos cerca a mi Ubicación');
                print(controlubicacion.cercanos);
              },
              icon: Icon(Icons.refresh),
              iconSize: 30),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Obx(
                () => Image.asset(
                  image.imagen,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              child: Container(
                width: 380,
                height: 560,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Obx(
                    () => (controlubicacion.locationlat != '')
                        ? getInfo(
                            context,
                            controlp.readLocations(),
                            controluser.uidf,
                            controlubicacion.locationlat,
                            controlubicacion.locationlo)
                        : Center(
                            //ICONO QUE TE ENVIA A GOOGLE MAPS
                            child: Text('Sin Datos')
                            //child: Icon(Icons.accessibility_new),
                            ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -1.02),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                child: Image.asset(
                  'assets/images/Logo_2.png',
                  width: 200,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 665, 0, 3),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0x00EEEEEE),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-91.82, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(1, 0, 1, 0),
                        child: Image.asset(
                          'assets/images/Botton_Nav_Blanco.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                        child: Image.asset(
                          'assets/images/BTN_ms.png',
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 80, 0, 4),
                          child: IconButton(
                            icon: Image.asset('assets/images/Home_off.png'),
                            iconSize: 50,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 80, 0, 0),
                          child: IconButton(
                            icon: Image.asset('assets/images/chat_off.png'),
                            iconSize: 50,
                            onPressed: () {
                              Get.to(() => ChatprivadoWidget());
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(77, 80, 0, 0),
                          child: IconButton(
                            icon: Image.asset(
                              'assets/images/game_off.png',
                            ),
                            iconSize: 50,
                            onPressed: () {
                              Get.to(() => SerwebWidget());
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 80, 0, 0),
                            child: IconButton(
                              icon: Image.asset('assets/images/perfil_off.png'),
                              iconSize: 50,
                              onPressed: () {
                                Get.to(() => PerfilWidget());
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  displayNotification({required String title, required String body}) async {
    final _plugin = FlutterLocalNotificationsPlugin();
    print("doing test NOTIFICACION");
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high);
    var platformChannelSpecifics =
        new NotificationDetails(android: androidPlatformChannelSpecifics);
    await _plugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'It could be anything you pass',
    );
  }
}

@override
Widget getInfo(BuildContext context, Stream<QuerySnapshot> ct, String uid,
    String lat, String lo) {
  return StreamBuilder(
    stream: ct,
    /*FirebaseFirestore.instance
        .collection('clientes')
        .snapshots(),*/ //En esta línea colocamos el el objeto Future que estará esperando una respuesta
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      print(snapshot.connectionState);
      switch (snapshot.connectionState) {

        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.active:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              ? VistaLocations(
                  locations: snapshot.data!.docs, uid: uid, lat: lat, lo: lo)
              : Text('Sin Datos');

        /*
             Text(
              snapshot.data != null ?'ID: ${snapshot.data['id']}\nTitle: ${snapshot.data['title']}' : 'Vuelve a intentar', 
              style: TextStyle(color: Colors.black, fontSize: 20),);
            */

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class VistaLocations extends StatelessWidget {
  final List locations;
  final String uid;
  final String lat;
  final String lo;
  const VistaLocations(
      {required this.locations,
      required this.uid,
      required this.lat,
      required this.lo});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listacalculo = [];
    Controllerlocations controlubicacion = Get.find();

    //*********Calculo de Distancias***********//

    double deg2rad(double deg) {
      return (deg * pi / 180.0);
    }

    double rad2deg(double rad) {
      return (rad * 180.0 / pi);
    }

    String distance(
        double lat1, double lon1, double lat2, double lon2, String unit) {
      double theta = lon1 - lon2;
      double dist = sin(deg2rad(lat1)) * sin(deg2rad(lat2)) +
          cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * cos(deg2rad(theta));
      dist = acos(dist);
      dist = rad2deg(dist);
      dist = dist * 60 * 1.1515;
      if (unit == 'K') {
        dist = dist * 1.609344;
      } else if (unit == 'N') {
        dist = dist * 0.8684;
      }
      return dist.toStringAsFixed(2);
    }

    //**********************************//

    for (int i = 0; i < locations.length; i++) {
      if (uid != locations[i]['uid']) {
        String distancia = distance(
            double.parse(lat),
            double.parse(lo),
            double.parse(locations[i]['lat']),
            double.parse(locations[i]['lo']),
            'K');

        var calc = <String, dynamic>{
          'name': locations[i]['name'],
          'lat': locations[i]['lat'],
          'lo': locations[i]['lo'],
          'Dist': distancia
        };
        // if (double.parse(distancia) < 500) listacalculo.add(calc);
        listacalculo.add(calc);
      }
    }

    listacalculo.sort((a, b) {
      return a['Dist'].compareTo(b['Dist']);
    });

    controlubicacion.cercanos = listacalculo.length.toString();

    return ListView.builder(
        itemCount: listacalculo.length == 0 ? 0 : listacalculo.length,
        itemBuilder: (context, posicion) {
          //print(listacalculo[posicion].id);
          return ListTile(
            leading: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: IconButton(
                onPressed: () async {
                  final url =
                      "https://www.google.es/maps?q=${listacalculo[posicion]['lat']},${listacalculo[posicion]['lo']}";
                  await launch(url);
                  print("boton con link de google");
                },
                icon: Icon(
                    Icons.map_sharp), // LINK DE GOOGLE ICONO MAPITA-BANDERITA
              ),
            ),
            title: Text(
                'Lat:${listacalculo[posicion]['lat']} Lo: ${listacalculo[posicion]['lo']}'),
            subtitle: Text(listacalculo[posicion]['name']),
            /*trailing: Container(
              width: 45,
              height: 20,
              color: Colors.red,
              child: Text(listacalculo[posicion]['Dist']),
            ),*/
          );
        });
  }
}
