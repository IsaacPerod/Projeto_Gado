import 'package:app/home_controller.dart';
import 'package:app/initial_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeController(
        child: const InitialPage()
        ),
    );
  } 
}