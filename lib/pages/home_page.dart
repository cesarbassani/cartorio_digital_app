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
    );
  }

  _body() {
    return Center(
      child: Text(
        "Home Page",
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}
