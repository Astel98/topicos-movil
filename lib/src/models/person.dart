import 'dart:convert';

class Persona {
  Persona({
    this.nombres,
    this.apellidos,
    this.ci,
    this.telefono,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.telefonoCodigo,
    this.correoElectronicoCodigo,
    this.usuario,
  });

  String? nombres;
  String? apellidos;

  int? ci;
  int? telefono;

  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;

  String? telefonoCodigo;
  String? correoElectronicoCodigo;

  Usuario? usuario;

  factory Persona.fromRawJson(String str) => Persona.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      nombres: json["nombres"],
      apellidos: json["apellidos"],
      ci: json["ci"],
      telefono: json["telefono"],
      fechaCreacion: DateTime.parse(json["fecha_creacion"]),
      fechaActualizacion: DateTime.parse(json["fecha_actualizacion"]),
      telefonoCodigo: json["telefono_codigo"],
      correoElectronicoCodigo: json["correo_electronico_codigo"],
      usuario: Usuario.fromJson(json["usuario"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nombres": nombres,
      "apellidos": apellidos,
      "ci": ci,
      "telefono": telefono,
      "fecha_creacion": fechaCreacion!.toIso8601String(),
      "fecha_actualizacion": fechaActualizacion!.toIso8601String(),
      "telefono_codigo": telefonoCodigo,
      "correo_electronico_codigo": correoElectronicoCodigo,
      "usuario": usuario!.toJson(),
    };
  }
}

class Usuario {
  Usuario({
    this.correoElectronico,
    this.password,
  });

  String? correoElectronico;
  String? password;

  factory Usuario.fromRawJson(String str) => Usuario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      correoElectronico: json["correo_electronico"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "correo_electronico": correoElectronico,
      "password": password,
    };
  }
}
