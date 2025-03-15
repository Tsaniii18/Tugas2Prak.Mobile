import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(AppPemesanMakanan());
}

class AppPemesanMakanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppPemesanMakanan',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: LoginPage(),
    );
  }
}