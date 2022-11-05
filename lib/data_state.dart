import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

//libraries

List<List<dynamic>> animales = [];

class DataState with ChangeNotifier {
  var numero;
  var date = DateTime.now()
      .toString()
      .substring(0, 10); // aca se guarda la fecha de ese dia

  DataState() {
    List<dynamic> row = [];
    row.add("evento");
    animales.add(row);
    row = [];
    row.add(date);
    animales.add(row);
    print("antes de loadnumbers");
    loadnumbers();
    print("despues de loadnumbers");
  }

  void loadnumbers() async {
    String aux = "00";
    String numero = "0";
    print("antes de entrar al while");
    while (true) {
      try {
        final client = RetryClient(http.Client());
        numero = await client.read(Uri.parse('http://192.168.11.4/rpi'));
        if (numero == aux || numero == "") continue;
        aux = numero;
        print(numero);
        print("dentro del while");
        List<dynamic> row = [];
        row.add(numero);

        animales.add(row);
      } finally {
        // client.close();
      }
      print("final del while");
    }
  }
}
