import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_journey/pages/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter journy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: HomePage(),
    );
  }
}
