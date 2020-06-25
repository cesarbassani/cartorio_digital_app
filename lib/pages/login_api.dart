import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String email, String senha) async {
    var url = 'http://meucartoriodigital.grupoimagetech.com.br:80/api/auth/login';

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "cliente": "cartorio1"
    };

    Map params = {
      "email": email,
      "password": senha
    };

    String s = json.encode(params);

    var response = await http.post(url, body: s, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = json.decode(response.body);

    String nomeUsuario = mapResponse['user']['nome'];
    String emailUsuario = mapResponse['user']['email'];

    print("Nome: $nomeUsuario");
    print("Email: $emailUsuario");

    return true;
  }
}
