import 'package:Matrix_Game2/domain/controller/auth_controller.dart';
import 'package:Matrix_Game2/domain/controller/firestore.dart';
import 'package:Matrix_Game2/domain/controller/image_controller.dart';
import 'package:Matrix_Game2/ui/pages/chatprivado/chatprivado_widget.dart';
import 'package:Matrix_Game2/ui/pages/configuracion/configuracion_widget.dart';
import 'package:Matrix_Game2/ui/pages/estados/widgets/edit_states.dart';
import 'package:Matrix_Game2/ui/pages/estados/widgets/estados_widget.dart';
import 'package:Matrix_Game2/ui/pages/serweb/serweb_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

// Widget que permite la creacion, edicion y visualizacion de estados
class ListaEstados extends StatefulWidget {
  @override
  _ListaEstadosState createState() => _ListaEstadosState();
}

class _ListaEstadosState extends State<ListaEstados> {
  ControllerFirestore controlp = Get.find();
  AuthenticationController controluser = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getInfo(context, controlp.readItems(), controluser.uidf),
    );
  }
}

@override
Widget getInfo(BuildContext context, Stream<QuerySnapshot> ct, String uid) {
  return StreamBuilder(
    stream: ct,
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      print(snapshot.connectionState);
      switch (snapshot.connectionState) {

        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return Center(
            child: CircularProgressIndicator(),
          );

        case ConnectionState.active:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              ? VistaEstados(estados: snapshot.data!.docs, uid: uid)
              : Text('Sin Datos');

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class VistaEstados extends StatelessWidget {
  final List estados;
  final String uid;
  VistaEstados({required this.estados, required this.uid});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Image_Control image = Get.find();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 120, 0, 0),
              child: Container(
                width: 380,
                height: 635,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListView.builder(
                    itemCount: estados.length == 0 ? 0 : estados.length,
                    itemBuilder: (context, posicion) {
                      print(estados[posicion].id);
                      return Card(
                        elevation: 2,
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 4.0, bottom: 16.0, left: 8.0, right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        estados[posicion]['photo']),
                                    backgroundColor: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 14.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      estados[posicion]['titulo'],
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ),
                                  (uid == estados[posicion]['uid'])
                                      ? IconButton(
                                          onPressed: () {
                                            Get.to(() => ModificarEstado(
                                                  estado: estados,
                                                  pos: posicion,
                                                  iddoc: estados[posicion].id,
                                                ));
                                          },
                                          icon: Icon(Icons.edit))
                                      : Text(''),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(estados[posicion]['detalle']),
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                              Container(
                                child: (estados[posicion]['fotoestado'] != '')
                                    ? Image.network(
                                        estados[posicion]['fotoestado'])
                                    : Text(''),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Text(estados[posicion]['name']),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 720),
                child: Image.asset(
                  'assets/images/cabezal.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.8, -1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(125, 45, 0, 0),
                child: Image.asset(
                  'assets/images/Logo_2.png',
                  width: 150,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 720, 0, 3),
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
                        child: IconButton(
                          icon: Image.asset('assets/images/BTN_ms.png'),
                          iconSize: 50,
                          onPressed: () {
                            Get.to(() => AgregarEstado());
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 80, 0, 4),
                          child: IconButton(
                            icon: Image.asset('assets/images/Home_on.png'),
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
                              icon: Image.asset('assets/images/setting.png'),
                              iconSize: 50,
                              onPressed: () {
                                Get.to(() => ConfiguracionWidget());
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
}
