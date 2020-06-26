import 'dart:convert';

import 'package:cartoriodigitalap/pages/api_response.dart';
import 'package:cartoriodigitalap/pages/components/loader.dart';
import 'package:cartoriodigitalap/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String email, String senha) async {
    try {
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

      Loader.show();
      var response = await http.post(url, body: s, headers: headers);
      Loader.hide();
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if(response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);
        return ApiResponse.ok(user);
      }

      if(response.statusCode == 401) {
        return ApiResponse.error("Email ou senha inválidos!");
      }

//    return ApiResponse.error(mapResponse['error']);
    } catch (error, exception) {
      print("Erro no login $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login!");
    }
  }
}
