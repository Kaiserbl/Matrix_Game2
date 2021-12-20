import 'package:Matrix_Game2/ui/pages/estados/states_screen.dart';
import 'package:Matrix_Game2/ui/pages/estados/widgets/estados_widget.dart';
import 'package:Matrix_Game2/ui/pages/serweb/response_screen.dart';
import 'package:get/get.dart';
import 'package:Matrix_Game2/domain/controller/image_controller.dart';
import 'package:Matrix_Game2/ui/pages/chatprivado/chatprivado_widget.dart';
import 'package:Matrix_Game2/ui/pages/configuracion/configuracion_widget.dart';

import 'package:flutter/material.dart';

class SerwebWidget extends StatefulWidget {
  const SerwebWidget({Key? key}) : super(key: key);

  @override
  _SerwebWidgetState createState() => _SerwebWidgetState();
}

class _SerwebWidgetState extends State<SerwebWidget> {
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: Image.asset(
                'assets/images/game_on.png',
                width: 20,
                fit: BoxFit.cover,
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
            //CONTENEDOR DE LAS CARTAS
            Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 100),
                  child: ResponseScreen(),
                )),
            //BOTON NAVEGACION ABAJO
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
                            icon: Image.asset('assets/images/Home_off.png'),
                            iconSize: 50,
                            onPressed: () {
                              Get.to(() => ListaEstados());
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
                              'assets/images/game_on.png',
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
                              icon:
                                  Image.asset('assets/images/setting_gris.png'),
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
