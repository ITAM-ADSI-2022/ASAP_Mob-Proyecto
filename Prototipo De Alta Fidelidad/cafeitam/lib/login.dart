import 'package:cafeitam/adminPage.dart';
import 'package:cafeitam/data/actual.dart';
import 'package:cafeitam/home.dart';
import 'package:cafeitam/palette.dart';
import 'package:cafeitam/registro.dart';
import 'package:cafeitam/widgets/textInput.dart';
import 'package:flutter/material.dart';

import 'utils/functionality.dart';
import 'widgets/actionButton.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = "";
  String _password = "";

  final _formKey = GlobalKey<FormState>();

  void login() {
    final _form = _formKey.currentState;
    if (_form!.validate()) {
      _form.save();
      if (_email == "admin" &&
          _password == DatosActuales.usuarios["admin"]["password"]) {
        DatosActuales.idActual = "admin";
        goto(context, AdminPage());
      } else if (_password == DatosActuales.usuarios[_email]["password"]) {
        DatosActuales.idActual = _email;
        goto(context, MyHomePage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                constraints: BoxConstraints(maxWidth: 300),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Cafe ITAM",
                      style: TextStyle(
                          color: Palette.mainGreen,
                          fontSize: 48,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(height: 16),
                    CustomTextInput(
                      labelText: "Correo institucional",
                      onSaved: (val) => _email = val!,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) =>
                          DatosActuales.usuarios.containsKey(val)
                              ? null
                              : "Checa tu correo",
                    ),
                    SizedBox(height: 16),
                    CustomTextInput(
                      isPassword: true,
                      onSaved: (val) => _password = val!,
                      labelText: "Contraseña",
                    ),
                    SizedBox(height: 24),
                    CustomActionButton(
                        text: "INICIAR SESIÓN", onPressed: login),
                    SizedBox(height: 16),
                    InkWell(
                        onTap: () {}, //() => goto(context, RecoveryPassword()),
                        child: Text("Recuperar Contraseña",
                            style: TextStyle(
                                color: Palette.mainGreen, fontSize: 14))),
                    SizedBox(height: 24),
                    Text("¿No tienes cuenta?"),
                    InkWell(
                        onTap: () => goto(context, Registro()),
                        child: Text(
                          "Regístrate",
                          style:
                              TextStyle(color: Palette.mainGreen, fontSize: 14),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
