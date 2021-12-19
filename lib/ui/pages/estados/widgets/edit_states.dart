import 'package:Matrix_Game2/domain/controller/firestore.dart';
import 'package:Matrix_Game2/domain/controller/image_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

// Widget que me permite editar un estado
class ModificarEstado extends StatefulWidget {
  final iddoc;
  final pos;
  final List estado;
  ModificarEstado({required this.estado, this.pos, this.iddoc});

  @override
  _ModificarEstadoState createState() => _ModificarEstadoState();
}

class _ModificarEstadoState extends State<ModificarEstado> {
  TextEditingController controltitulo = TextEditingController();
  TextEditingController controldetalle = TextEditingController();
  ControllerFirestore controlestados = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controltitulo =
        TextEditingController(text: widget.estado[widget.pos]['titulo']);
    controldetalle =
        TextEditingController(text: widget.estado[widget.pos]['detalle']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Image_Control image = Get.find();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[700],
        title: Text("Editar Estado "),
        actions: [
          IconButton(
              tooltip: 'Eliminar Cliente',
              icon: Icon(Icons.delete),
              onPressed: () {
                controlestados.eliminarestados(widget.estado[widget.pos].id);
                Get.back();
              })
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
              alignment: AlignmentDirectional(0.07, -0.61),
              child: Image.asset(
                'assets/images/Logo_1.png',
                width: 180,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 320, 0, 0),
              child: Container(
                width: 380,
                height: 300,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: controltitulo,
                        decoration: InputDecoration(labelText: "Titulo"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: controldetalle,
                        decoration: InputDecoration(labelText: "Descripcion"),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: ElevatedButton(
                          child: Text("Guardar"),
                          onPressed: () {
                            var estado = <String, dynamic>{
                              'titulo': controltitulo.text,
                              'detalle': controldetalle.text,
                            };

                            controlestados.actualizarestado(
                                widget.estado[widget.pos].id, estado);

                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurpleAccent[700]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
