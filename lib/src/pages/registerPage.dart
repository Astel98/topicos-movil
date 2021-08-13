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

  final nombresController = TextEditingController();
  String? nombresErrorMessage;
  final apellidosController = TextEditingController();
  String? apellidosErrorMessage;
  final correoElectronicoController = TextEditingController();
  String? correoElectronicoErrorMessage;
  final contrasenaController = TextEditingController();
  String? contrasenaErrorMessage;
  final repetirContrasenaController = TextEditingController();
  String? repetirContrasenaErrorMessage;
  final carnetController = TextEditingController();
  String? carnetErrorMessage;
  final direccionController = TextEditingController();
  String? direccionErrorMessage;
  final fechaNacimientoController = TextEditingController();
  String? fechaNacimientoErrorMessage;
  final telefonoController = TextEditingController();
  String? telefonoErrorMessage;

  Widget renderNombre() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        controller: nombresController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Nombre(s)*',
          errorText: nombresErrorMessage,
        ),
        onChanged: (name) => persona.nombres = name,
        validator: (name) => name!.isEmpty ? 'Nombre Requerido' : null,
      ),
    );
  }

  Widget renderApellido() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        controller: apellidosController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Apellido(s)*',
          errorText: apellidosErrorMessage,
        ),
        onChanged: (apellidos) => persona.apellidos = apellidos,
        validator: (apellidos) => apellidos!.isEmpty ? 'Apellidos Requeridos' : null,
      ),
    );
  }

  Widget renderCorreo() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        controller: correoElectronicoController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Correo electrónico*',
          errorText: correoElectronicoErrorMessage,
        ),
        onChanged: (email) => persona.usuario!.correoElectronico = email,
        validator: (email) => email!.isEmpty ? 'Correo Requerido' : null,
      ),
    );
  }

  Widget renderPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        controller: contrasenaController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Contraseña*',
          errorText: contrasenaErrorMessage,
        ),
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
        controller: repetirContrasenaController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Confirmar contraseña*',
          errorText: repetirContrasenaErrorMessage,
        ),
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
        controller: carnetController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Carnet de identidad*',
          errorText: carnetErrorMessage,
        ),
        keyboardType: TextInputType.number,
        onChanged: (ci) => this.persona.ci = int.tryParse(ci),
        validator: (ci) => ci!.isEmpty ? 'Número Requerido' : null,
      ),
    );
  }

  Widget renderDireccion() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        controller: direccionController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Dirección*'
        ),
        onChanged: (address) => this.persona.telefonoCodigo = address,
        validator: (address) => address!.isEmpty ? 'Dirección Requerida' : null,
      ),
    );
  }

  DateTime _date = DateTime.now();

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
      helpText: 'Selecciona una fecha',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
        fechaNacimientoController.text = newDate.day.toString().padLeft(2, "0") + "/" + newDate.month.toString().padLeft(2, "0") + "/" + newDate.year.toString();
      });
    }
  }

  Widget renderFecha() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        controller: fechaNacimientoController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Fecha de nacimiento*'
        ),
        readOnly: true,
        onChanged: (birthdate) => this.persona.fechaCreacion = DateTime.tryParse(birthdate),
        validator: (birthdate) => DateTime.tryParse(birthdate!) == null ? 'Fecha Requerida' : null,
        onTap: () {
          _selectDate();
        },
      ),
    );
  }

  Widget renderTelf() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        controller: telefonoController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Teléfono*',
          errorText: telefonoErrorMessage,
        ),
        keyboardType: TextInputType.number,
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
  void initState() {
    nombresController.addListener(() {
      if (nombresController.text.isEmpty) {
        setState(() {
          nombresErrorMessage = "Este campo es requerido.";
        });
      } else {
        setState(() {
          nombresErrorMessage = null;
        });
      }
    });
    apellidosController.addListener(() {
      if (apellidosController.text.isEmpty) {
        setState(() {
          apellidosErrorMessage = "Este campo es requerido.";
        });
      } else {
        setState(() {
          apellidosErrorMessage = null;
        });
      }
    });
    correoElectronicoController.addListener(() {
      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(correoElectronicoController.text);
      if (correoElectronicoController.text.isEmpty) {
        setState(() {
          correoElectronicoErrorMessage = "Este campo es requerido.";
        });
      } else if (!emailValid) {
        setState(() {
          correoElectronicoErrorMessage = "Ingrese un correo electrónico válido.";
        });
      } else {
        setState(() {
          correoElectronicoErrorMessage = null;
        });
      }
    });
    contrasenaController.addListener(() {
      if (contrasenaController.text.isEmpty) {
        setState(() {
          contrasenaErrorMessage = "Este campo es requerido.";
        });
      } else if (contrasenaController.text.length < 8) {
        setState(() {
          contrasenaErrorMessage = "La contraseña debe tener 8 caracteres mínimo.";
        });
      } else {
        setState(() {
          contrasenaErrorMessage = null;
        });
      }
    });
    repetirContrasenaController.addListener(() {
      if (repetirContrasenaController.text.isEmpty) {
        setState(() {
          repetirContrasenaErrorMessage = "Este campo es requerido.";
        });
      } else if (repetirContrasenaController.text != contrasenaController.text) {
        setState(() {
          repetirContrasenaErrorMessage = "Las contraseñas no coinciden.";
        });
      } else {
        setState(() {
          repetirContrasenaErrorMessage = null;
        });
      }
    });
    carnetController.addListener(() {
      if (carnetController.text.isEmpty) {
        setState(() {
          carnetErrorMessage = "Este campo es requerido.";
        });
      } else if (double.tryParse(carnetController.text) == null) {
        setState(() {
          carnetErrorMessage = "Solo se aceptan valores numéricos.";
        });
      } else {
        setState(() {
          carnetErrorMessage = null;
        });
      }
    });
    telefonoController.addListener(() {
      if (telefonoController.text.isEmpty) {
        setState(() {
          telefonoErrorMessage = "Este campo es requerido.";
        });
      } else if (double.tryParse(telefonoController.text) == null) {
        setState(() {
          telefonoErrorMessage = "Solo se aceptan valores numéricos.";
        });
      } else {
        setState(() {
          telefonoErrorMessage = null;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
              renderFecha(),
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
