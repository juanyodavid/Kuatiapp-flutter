//libraries

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_state.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KuatiApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (BuildContext context) => DataState(),
        child: HomePage(),
        // home: MyHomePage(),
      ),
    );
  }
}
