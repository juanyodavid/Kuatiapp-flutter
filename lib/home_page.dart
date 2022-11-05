//libraries
import 'data_state.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'styles.dart';

import 'add_to_do_botton.dart';
import 'hero_dialog_route.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'getCsv.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _connectionStatus = 'Unknown';
  var connectivity;
  late StreamSubscription<ConnectivityResult> subscription;
  @override
  void initState() {
    super.initState();
    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatus = result.toString();
      // print(_connectionStatus);
      if (result == ConnectivityResult.wifi) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Future getData() async {
    String numero = "0";
    // if (animales.length == 0) {
    //   loadnumbers();
    // }
    http.Response response =
        await http.get(Uri.parse('http://192.168.11.1/rpi'));
    if (response.statusCode == HttpStatus.ok) {
      // VER QUE HACE ESTA LINEA DE CODIGO
      numero = response.body;
      // print("antes del if");
      // print("1aux: " + entry.auxiliary());
      // print("1numero: " + numero);
      //TODO: Poner una validator
      if (numero != entry.auxiliary() && numero != "") {
        entry.setAux(numero);
        // print("aux: " + entry.auxiliary());
        // print("numero: " + numero);
        List<dynamic> row = [];
        row.add(numero);
        animales.add(row);
        // print(animales);
      }
      // print(numero);
      return animales;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lectura de animales: "),
        leading: new Icon(Icons.home),
      ),
      body: new FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new ListView.builder(
              itemBuilder: (context, i) => new ListTile(
                //TODO: Poner un icono y al lado los animales
                title: Text(animales[i][0]),
              ),
              itemCount: animales.length,
            );
          } else {
            return Center(
              child: new CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
          child: AddTodoButton(),
        ),
        FloatingActionButton.extended(
          onPressed: getCsv,
          label: const Text('Descargar'),
          icon: const Icon(Icons.download),
          backgroundColor: Colors.blue[300],
        ),
      ]),
    );
  }
}

List<List<dynamic>> animales = [];

class Validator {
  static String aux = "0";
  String auxiliary() {
    return aux;
  }

  void setAux(String auxi) {
    aux = auxi;
  }
}

Validator entry = new Validator();
void loadnumbers(String evento) {
  print(evento);
  print(animales);
  animales.clear();
  print(animales);
  var date = DateTime.now()
      .toString()
      .substring(0, 10); // aca se guarda la fecha de ese dia

  List<dynamic> row = [];
  row.add(evento);
  animales.add(row);
  row = [];
  row.add(date);
  animales.add(row);
  print("despues de loadnumbers");
}
