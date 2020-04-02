import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/components/text_field_custom/text_field_custom_widget.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final String title;

  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextFieldCustomWidget(
                      labelText: "Nome Completo",
                      textInputType: TextInputType.text,
                      errorText: controller.validateName,
                      onChanged: controller.setName,
                    )),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextFieldCustomWidget(
                    labelText: "E-mail",
                    textInputType: TextInputType.emailAddress,
                    errorText: controller.validateEmail,
                    onChanged: controller.setEmail,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextFieldCustomWidget(
                    labelText: "Senha",
                    textInputType: TextInputType.visiblePassword,
                    obscureText: true,
                    errorText: controller.validatePassword,
                    onChanged: controller.setPassword,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Observer(builder: (_) {
                      return RaisedButton(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        color: Colors.black87,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        onPressed:
                            controller.isValid ? controller.registerUser : null,
                      );
                    })),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Observer(builder: (_) {
                    return Center(
                      child: Text(
                        controller.messageError,
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
