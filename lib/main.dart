import 'package:Matrix_Game2/domain/controller/connectivity.dart';
import 'package:Matrix_Game2/ui/pages/estados/states_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Matrix_Game2/domain/controller/chat_controller.dart';
import 'package:Matrix_Game2/domain/controller/firestore.dart';
import 'package:Matrix_Game2/domain/use_case/controllers/location2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Matrix_Game2/domain/controller/auth_controller.dart';
import 'package:Matrix_Game2/domain/controller/image_controller.dart';
import 'package:Matrix_Game2/domain/methods/authentication_metodos.dart';
import 'package:Matrix_Game2/domain/methods/firestore_metodos.dart';
import 'package:Matrix_Game2/domain/methods/verificacion_metodos.dart';
import 'package:Matrix_Game2/ui/pages/login/login_widget.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
    updatePositionInBackground,
    isInDebugMode: true,
  );
  await Firebase.initializeApp();
  Get.put(Image_Control());
  Get.put(FirestoreDatabase());
  Get.put(AuthManagement());
  Get.put(AuthenticationController());
  Get.put(PasswordAuth());
  Get.put(ChatController());
  Get.put(ControllerFirestore());
  Get.put(Controllerlocations());
  // Connectivity Controller
  ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  // Connectivity stream
  Connectivity().onConnectivityChanged.listen((connectivityStatus) {
    connectivityController.connectivity = connectivityStatus;
  });
  runApp(MyApp());
}

void updatePositionInBackground() async {
  Workmanager().executeTask((task, inputData) async {
    Controllerlocations controlubicacion = Get.find();
    controlubicacion.obtenerubicacion();
    return Future.value(true);
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'BottonExample',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListaEstados();
            } else {
              return LoginWidget();
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
