import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../models/person.dart';
import '../services/auth.dart';

import '../globals.dart' show Routes;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  Persona persona = Persona(usuario: Usuario());

  Widget renderEmailInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Usuario o Correo Electronico'),
        onChanged: (email) => persona.usuario!.correoElectronico = email,
        validator: (email) => email!.isEmpty ? 'Correo Requerido' : null,
      ),
    );
  }

  Widget renderPasswordInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Contraseña'),
        obscureText: true,
        onChanged: (pwd) => persona.usuario!.password = pwd,
        validator: (pwd) => pwd!.isEmpty ? 'Contraseña Requerida' : null,
      ),
    );
  }

  Widget renderLoginButton() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        child: Text('Entrar'),
        textColor: Colors.white,
        color: Colors.deepPurpleAccent.shade400,
        onPressed: () async {
          // if (!_formKey.currentState!.validate()) {
            print(this.persona.usuario!.toRawJson());
            await Auth.instance.signIn(this.persona.usuario);
            Get.toNamed(Routes.home);
          // }
        },
      ),
    );
  }

  Widget renderDivisor() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(child: Divider(height: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('0'),
          ),
          Expanded(child: Divider(height: 1))
        ],
      ),
    );
  }

  Widget renderLoginRegister(context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: RaisedButton(
        child: Text('Registrate'),
        textColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, 'register');
        },
        color: Colors.deepPurpleAccent.shade400,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), backgroundColor: Colors.deepPurpleAccent.shade400),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: Colors.white),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Image.asset('assets/imagen1.jpg'),
              renderEmailInput(),
              renderPasswordInput(),
              renderLoginButton(),
              //renderCreateAccountLink(),
              renderDivisor(),
              renderLoginRegister(context)
            ],
          ),
        ),
      ),
    );
  }
}
