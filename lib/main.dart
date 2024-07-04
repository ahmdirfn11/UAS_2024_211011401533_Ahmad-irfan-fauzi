import 'package:flutter/material.dart';
import 'CryptoList.dart'; // Sesuaikan dengan nama file

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CryptoList(),
    );
  }
}
