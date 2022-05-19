import 'package:cafeitam/data/actual.dart';
import 'package:cafeitam/home.dart';
import 'package:cafeitam/palette.dart';
import 'package:cafeitam/utils/functionality.dart';
import 'package:cafeitam/widgets/actionButton.dart';
import 'package:cafeitam/widgets/textInput.dart';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  String _email = "";
  String _password = "";
  String _cu = "";
  String _nombre = "";

  final _formKey = GlobalKey<FormState>();

  void registro() {
    final _form = _formKey.currentState;
    if (_form!.validate()) {
      _form.save();
      DatosActuales.usuarios[_email] = {
        "email": _email,
        "password": _password,
        "nombre": _nombre,
        "cu": _cu
      };
      DatosActuales.idActual = _email;
      print(DatosActuales.usuarios);
      print(DatosActuales.idActual);
      showSnack(
          context: context, text: "Registro exitoso", durationInSeconds: 2);
      goto(context, MyHomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: BackButton(color: Palette.mainGreen),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Registro",
                    style: TextStyle(
                        color: Palette.mainGreen,
                        fontSize: 48,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(height: 16),
                  CustomTextInput(
                    labelText: "Clave Única",
                    onSaved: (val) => _cu = val!,
                    validator: (val) =>
                        (val!.length == 6) ? null : "CU debe ser de 6 digitos",
                    keyboardType: TextInputType.number,
                  ),
                  Container(height: 16),
                  CustomTextInput(
                    labelText: "Nombre y Apellido",
                    onSaved: (val) => _nombre = val!,
                    validator: (val) =>
                        (val!.length > 5) ? null : "Ingresa tu nombre",
                    keyboardType: TextInputType.number,
                  ),
                  Container(height: 16),
                  CustomTextInput(
                    labelText: "Correo institucional",
                    onSaved: (val) => _email = val!,
                    validator: (val) =>
                        val!.contains("@") ? null : "Checa tu correo",
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 16),
                  CustomTextInput(
                    isPassword: true,
                    onSaved: (val) => _password = val!,
                    validator: (val) => val!.length < 6
                        ? "Contraseña debe mayor a 7 digitos"
                        : null,
                    labelText: "Elige una Contraseña",
                  ),
                  SizedBox(height: 16),
                  CustomTextInput(
                    isPassword: true,
                    //onSaved: (val) => _password = val!,
                    validator: (val) =>
                        val == _password ? "Contraseñas no coinciden" : null,
                    labelText: "Confirma tu Contraseña",
                  ),
                  SizedBox(height: 24),
                  CustomActionButton(text: "REGÍSTRATE", onPressed: registro),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
