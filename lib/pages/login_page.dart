import 'package:cartoriodigitalap/utils/nav.dart';
import 'package:cartoriodigitalap/widgets/app_button.dart';
import 'package:cartoriodigitalap/widgets/app_text.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_api.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _tEmail = TextEditingController(text: "user3@cartorio1.com");
  final _tSenha = TextEditingController(text: "password");
  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("9º Ofício"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText(
              "E-mail",
              "Digite o email",
              controller: _tEmail,
              validator: _validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              "Senha",
              "Digite a senha",
              password: true,
              controller: _tSenha,
              validator: _validateSenha,
              focusNode: _focusSenha,
            ),
            SizedBox(
              height: 20,
            ),
            AppButton(
              "Login",
              onPressed: _onClickLogin,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    String email = _tEmail.text;
    String senha = _tSenha.text;

    bool ok = await LoginApi.login(email, senha);
    if(ok) {
      push(context, HomePage());
    } else {
      print("Login incorreto!");
    }
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o E-mail";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite o senha";
    }
    if (text.length < 6) {
      return "A senha precisa ter pelo menos 6 caracteres";
    }
    return null;
  }
}
