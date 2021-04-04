import 'package:flutter/material.dart';
import 'package:ui_design/appBar.dart';
import 'package:ui_design/productList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //HttpService a = HttpService();
  // Product p = Product();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Bar(),
          Expanded(
            child: Text("Hello"),
          ),
        ],
      ),
    ));
  }
}
