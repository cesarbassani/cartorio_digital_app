import 'dart:convert' as convert;

import 'package:cartoriodigitalap/pages/servico/servico.dart';
import 'package:http/http.dart' as http;

class ServicosApi {
  static Future<List<Servico>> getServicos() async {

    var url = 'http://meucartoriodigital.grupoimagetech.com.br/api/servico/base';

    var response = await http.get(url);

    String json = response.body;

    List list = convert.json.decode(json);

    final servicos = List<Servico>();

    for(Map map in list) {
      Servico servico = Servico.fromJson(map);
      servicos.add(servico);
    }

    return servicos;
  }
}