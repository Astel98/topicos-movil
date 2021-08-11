import 'package:flutter/material.dart';
import 'package:topicos_clinica/src/models/person.dart';

import '../globals.dart';
import 'package:get/route_manager.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  Persona persona = Persona(usuario: Usuario());
  String? repeatPassword;

  Widget renderNombre() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Nombre(s)'),
        onChanged: (name) => persona.nombres = name,
        validator: (name) => name!.isEmpty ? 'Nombre Requerido' : null,
      ),
    );
  }

  Widget renderApellido() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Apellido(s)'),
        onChanged: (apellidos) => persona.apellidos = apellidos,
        validator: (apellidos) => apellidos!.isEmpty ? 'Apellidos Requeridos' : null,
      ),
    );
  }

  Widget renderCorreo() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Correo Electronico'),
        onChanged: (email) => persona.usuario!.correoElectronico = email,
        validator: (email) => email!.isEmpty ? 'Correo Requerido' : null,
      ),
    );
  }

  Widget renderPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Contraseña'),
        obscureText: true,
        onChanged: (pwd) => persona.usuario!.password = pwd,
        validator: (pwd) => pwd!.isEmpty ? 'Contraseña Requerida' : null,
      ),
    );
  }

  Widget renderConfirmPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Confirmar contraseña'),
        obscureText: true,
        onChanged: (pwd) => this.repeatPassword = pwd,
        validator: (pwd) => pwd != this.persona.usuario!.password ? 'Confirmar Contraseña' : null,
      ),
    );
  }

  Widget renderCarnet() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Carnet de identidad'),
        onChanged: (ci) => this.persona.ci = int.tryParse(ci),
        validator: (ci) => ci!.isEmpty ? 'Número Requerido' : null,
      ),
    );
  }

  Widget renderDireccion() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Direccion'),
        onChanged: (address) => this.persona.telefonoCodigo = address,
        validator: (address) => address!.isEmpty ? 'Dirección Requerida' : null,
      ),
    );
  }

  Widget renderFecha() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Fecha de nacimiento'),
        onChanged: (birthdate) => this.persona.fechaCreacion = DateTime.tryParse(birthdate),
        validator: (birthdate) => DateTime.tryParse(birthdate!) == null ? 'Fecha Requerida' : null,
      ),
    );
  }

  Widget renderTelf() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Telefono'),
        onChanged: (phone) => this.persona.telefono = int.tryParse(phone),
        validator: (phone) => int.tryParse(phone!) == null ? 'Teléfono Requerido' : null,
      ),
    );
  }

  Widget renderSexo() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Sexo'),
        onChanged: (gender) {},
        validator: (gender) => 'MFmf'.contains(gender!) ? null : 'Género Requerido (M/F)',
      ),
    );
  }

  Widget renderLoginButton() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        child: Text('Registrar'),
        textColor: Colors.white,
        onPressed: () {
          if (this._formKey.currentState!.validate()) {
            Get.toNamed(Routes.home);
          }
        },
        color: Colors.deepPurpleAccent.shade400,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear una cuenta'),
        backgroundColor: Colors.deepPurpleAccent.shade400,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: Colors.white),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Image.asset('assets/imagen2.jpg'),
              renderNombre(),
              renderApellido(),
              renderCorreo(),
              renderPassword(),
              renderConfirmPassword(),
              renderCarnet(),
              // renderDireccion(),
              // renderFecha(),
              renderTelf(),
              // renderSexo(),
              renderLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
