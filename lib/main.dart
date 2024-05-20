import 'package:app/home_controller.dart';
import 'package:app/home_page.dart';
import 'package:app/initial_page.dart';
import 'package:app/principal_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

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

class RoteadorTela extends StatelessWidget {
  const RoteadorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(), 
      builder:(context, snapshot) {
        if (snapshot.hasData) {
          return const PrincipalPage();
        } else {
          return const HomePage();
        }
    },);
  }
}