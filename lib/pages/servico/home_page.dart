import 'package:cartoriodigitalap/drawer_list.dart';
import 'package:cartoriodigitalap/pages/components/loader.dart';
import 'package:cartoriodigitalap/pages/servico/servico.dart';
import 'package:cartoriodigitalap/pages/servico/servicos_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "9º Ofício",
        ),
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  _body() {
    Future<List<Servico>> future = ServicosApi.getServicos();

    int countService;

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),);
        }
        List<Servico> servicos = snapshot.data;
        return _listView(servicos);
      },
    );
  }

  Container _listView(List<Servico> servicos) {
    return Container(
    padding: EdgeInsets.all(16),
    child: ListView.builder(
        itemCount: servicos != null ? servicos.length : 0,
        itemBuilder: (context, index) {
          Servico servico = servicos[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10,),
            color: Theme.of(context).primaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xFFEAEAEA),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  width: 70,
                  child: Image.asset(
                    "assets/images/ic_company.png",
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 15, top: 15, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          servico.descricao,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Valor: R\$ ${servico.valor.toString()}",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {},
                            ),
                            Text(
                              "0",
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
  );
  }
}
