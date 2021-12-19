import 'package:Matrix_Game2/ui/pages/estados/states_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Matrix_Game2/ui/pages/login/login_widget.dart';

class FirebaseCentral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListaEstados();
        } else {
          return LoginWidget();
        }
      },
    );
  }
}
