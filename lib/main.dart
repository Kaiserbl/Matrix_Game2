import 'package:firebase_auth/firebase_auth.dart';
import 'package:Matrix_Game2/domain/controller/chat_controller.dart';
import 'package:Matrix_Game2/domain/controller/firestore.dart';
import 'package:Matrix_Game2/domain/use_case/controllers/location2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Matrix_Game2/domain/controller/auth_controller.dart';
import 'package:Matrix_Game2/domain/controller/image_controller.dart';
import 'package:Matrix_Game2/domain/controller/state_controller.dart';
import 'package:Matrix_Game2/domain/controller/state_controller2.dart';
import 'package:Matrix_Game2/domain/methods/authentication_metodos.dart';
import 'package:Matrix_Game2/domain/methods/firestore_metodos.dart';
import 'package:Matrix_Game2/domain/methods/verificacion_metodos.dart';
import 'package:Matrix_Game2/domain/use_case/controllers/location.dart';
import 'package:Matrix_Game2/domain/use_case/controllers/permissions.dart';
import 'package:Matrix_Game2/domain/use_case/permission_management.dart';
import 'package:Matrix_Game2/ui/pages/inicio/inicio_widget.dart';
import 'package:Matrix_Game2/ui/pages/login/login_widget.dart';

//probando rama juan
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(StateController());
  Get.put(StateController2());
  Get.put(Image_Control());
  Get.put(FirestoreDatabase());
  Get.put(AuthManagement());
  Get.put(AuthenticationController());
  Get.put(PasswordAuth());
  PermissionsController permissionsController =
      Get.put(PermissionsController());
  permissionsController.permissionManager = PermissionManager();
  Get.put(LocationController());
  Get.put(ChatController());
  Get.put(ControllerFirestore());
  Get.put(Controllerlocations());

  runApp(MyApp());
}

//6000+8000
class MyApp extends StatelessWidget {
  /*final Future<FirebaseApp> _initialization = Firebase.initializeApp();*/
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'BottonExample',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GetX<AuthenticationController>(
          builder: (controller) {
            if (controller.isLogged.value) {
              return InicioWidget();
            } else {
              return const LoginWidget();
            }
          },
        ));
  }
}

class Wrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Something went wrong")),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Loading")),
    );
  }
}
