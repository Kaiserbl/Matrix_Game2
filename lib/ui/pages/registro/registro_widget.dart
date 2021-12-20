import 'package:get/get.dart';
import 'package:Matrix_Game2/domain/controller/auth_controller.dart';
import 'package:Matrix_Game2/domain/controller/image_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class RegistroWidget extends StatefulWidget {
  const RegistroWidget({Key? key}) : super(key: key);

  @override
  _RegistroWidgetState createState() => _RegistroWidgetState();
}

class _RegistroWidgetState extends State<RegistroWidget> {
  late TextEditingController textcontrollerEmail; //Email
  late bool checkboxListTileValue;
  late TextEditingController textcontrollerPass; //Password
  late TextEditingController textcontrollerUser;
  late TextEditingController textcontrollerName;
  late TextEditingController textcontrollerConPass; //Confirmar Password
  AuthenticationController authenticationController = Get.find();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textcontrollerEmail = TextEditingController();
    textcontrollerPass = TextEditingController();
    textcontrollerUser = TextEditingController();
    textcontrollerName = TextEditingController();
    textcontrollerConPass = TextEditingController();
    checkboxListTileValue = false;
  }

  @override
  bool isEmail(String em) {
    String p =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$";
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  void errorFormatos() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "ERROR",
            ),
            content: Text("El correo no tiene el formato requerido"),
            actions: <Widget>[
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void errorFormatos3() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "ERROR",
            ),
            content: Text("Todos los campos son requeridos"),
            actions: <Widget>[
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void errorFormatos2() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "ERROR",
            ),
            content: Text("La contraseña y su confirmacion no son la misma"),
            actions: <Widget>[
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void errorFormatos4() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "ERROR",
            ),
            content: Text("El nombre y usuario son requeridos"),
            actions: <Widget>[
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void errorCheckBox() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "ERROR",
            ),
            content: Text("Por favor acepte los terminos y condiciones"),
            actions: <Widget>[
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Image_Control image = Get.find();

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Stack(
            children: [
              Obx(
                () => Image.asset(
                  image.imagen,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              ListView(
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.9, -0.95),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                      child: Image.asset(
                        'assets/images/Logo_2.png',
                        width: 150,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.09, -0.90),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 60),
                      child: Container(
                        width: 330,
                        height: 650,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.45, -0.2),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.56, 0.62),
                                  child: Text(
                                    'Acepto',
                                    style: FlutterFlowTheme.subtitle2,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.21, 0.48),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 20, 20, 20),
                                    child: AutoSizeText(
                                      'Acepta el envio de correo de confirmacion \nde perfil, notificaciones de actualizacion y \ndemas comunicados para mejorar la aplicacion. acepta el tratamiento de su informacion para darle un mejor servicio',
                                      textAlign: TextAlign.justify,
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'NEXA',
                                        fontWeight: FontWeight.w300,
                                        useGoogleFonts: false,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0.65),
                                  child: CheckboxListTile(
                                    value: checkboxListTileValue,
                                    onChanged: (newValue) => setState(() =>
                                        checkboxListTileValue = newValue!),
                                    tileColor: Color(0xFFF5F5F5),
                                    dense: true,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.04, -0.38),
                                  child: Container(
                                    width: 300,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC9C6C6),
                                      borderRadius: BorderRadius.circular(36),
                                    ),
                                    //control Nombre
                                    child: TextFormField(
                                      controller: textcontrollerEmail,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 13),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'NEXA',
                                        fontSize: 22,
                                        useGoogleFonts: false,
                                      ),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Correo';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.8, -0.48),
                                  child: Text(
                                    'CORREO',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'NEXA',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.8, -0.74),
                                  child: Text(
                                    'USUARIO',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'NEXA',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                                //BOTON REGISTRO
                                Align(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 480, 3, 0),
                                    child: Container(
                                      child: Stack(children: [
                                        Align(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 1, 0, 0),
                                            child: GestureDetector(
                                              child: Align(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Image.asset(
                                                      'assets/images/Boton_.png',
                                                      height: 35,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          child: SizedBox(
                                            width: 230,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(1, 8, 2, 2),
                                              child: TextButton(
                                                key: Key('register2Submit'),
                                                style: TextButton.styleFrom(
                                                  padding:
                                                      const EdgeInsets.all(-8),
                                                  primary: Color(0xFFFABAFA),
                                                ),
                                                onPressed: () async {
                                                  print("Registrando...");
                                                  try {
                                                    await authenticationController.signup(
                                                        userName:
                                                            textcontrollerName
                                                                .text,
                                                        nickName:
                                                            textcontrollerUser
                                                                .text,
                                                        email:
                                                            textcontrollerEmail
                                                                .text,
                                                        password:
                                                            textcontrollerPass
                                                                .text);
                                                    Get.back();
                                                  } catch (e) {
                                                    print(e);
                                                  }
                                                },
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 0),
                                                  child: Text(
                                                    'Registro',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'NEXA',
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts: false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                                //
                                Align(
                                  alignment: AlignmentDirectional(-0.8, 0.03),
                                  child: Text(
                                    ' CONFIRMAR CONTRASEÑA',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'NEXA',
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.12, -0.12),
                                  child: Container(
                                    width: 300,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC9C6C6),
                                      borderRadius: BorderRadius.circular(36),
                                    ),
                                    //contro nickName
                                    child: TextFormField(
                                      controller: textcontrollerPass,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 13),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'NEXA',
                                        fontSize: 22,
                                        useGoogleFonts: false,
                                      ),
                                      textAlign: TextAlign.center,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Contraseña';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.8, -0.23),
                                  child: Text(
                                    'CONTRASEÑA',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'NEXA',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.08, -0.64),
                                  child: Container(
                                    width: 300,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC9C6C6),
                                      borderRadius: BorderRadius.circular(36),
                                    ),
                                    //control Correo
                                    child: TextFormField(
                                      controller: textcontrollerUser,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 13),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'NEXA',
                                        fontSize: 22,
                                        useGoogleFonts: false,
                                      ),
                                      textAlign: TextAlign.center,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Usuario';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.06, -0.88),
                                  child: Container(
                                    width: 300,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC9C6C6),
                                      borderRadius: BorderRadius.circular(36),
                                    ),
                                    // control Contraseña
                                    child: TextFormField(
                                      controller: textcontrollerName,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 13),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'NEXA',
                                        fontSize: 22,
                                        useGoogleFonts: false,
                                      ),
                                      textAlign: TextAlign.center,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Nombre';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.8, -0.97),
                                  child: Text(
                                    'NOMBRE',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'NEXA',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.36, 0.15),
                                  child: Container(
                                    width: 300,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC9C6C6),
                                      borderRadius: BorderRadius.circular(36),
                                    ),
                                    //control ConContraseña
                                    child: TextFormField(
                                      controller: textcontrollerConPass,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 13),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'NEXA',
                                        fontSize: 22,
                                        useGoogleFonts: false,
                                      ),
                                      textAlign: TextAlign.center,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Confirmar contraseña';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
