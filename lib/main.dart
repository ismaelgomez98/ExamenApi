import 'package:exame_api/src/pages/Home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'examen_api',
      initialRoute: '/home',
      routes: {
        '/home': (_) => HomePage(),
      },
    );
  }
}
