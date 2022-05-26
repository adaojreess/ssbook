import 'package:desafio_studio_sol/src/theme/default_theme.dart';
import 'package:desafio_studio_sol/src/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SSBOOK',
      theme: DefaultTheme.theme(context),
      home: const HomePage(title: 'Home'),
    );
  }
}
