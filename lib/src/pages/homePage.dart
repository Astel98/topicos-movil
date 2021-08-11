import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:topicos_clinica/src/services/auth.dart';

import '../globals.dart' show Routes;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade400,
        title: Text('Bienvenido 🤗'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await Auth.instance.signOut();
              await Get.offAllNamed(Routes.login);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Logueado como Paciente',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
