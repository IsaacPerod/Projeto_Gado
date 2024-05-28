import 'package:app/common/Navigation_Drawer.dart';
import 'package:app/services/api_service.dart';
import 'package:app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:app/common/background.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meus Dados'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        backgroundColor: Colors.transparent,
      ),
      drawer: const DrawerNav(),
      body: Stack(
        children: [
          Background(
            child: Container(),
          ),
          SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10), // Adiciona margem ao Container
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      heightFactor: 3,
                      child: Text('  Nome: ${user?.displayName}'),
                    ),
                    const Divider(color: Color.fromARGB(255, 75, 75, 75)),
                    Align(
                      alignment: Alignment.centerLeft,
                      heightFactor: 3,
                      child: Text('  Email: ${user?.email}'),
                    ),
                    const Divider(color: Color.fromARGB(255, 75, 75, 75)),
                    const SizedBox(height: 200),
                    ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Voltar'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          const Color.fromARGB(255, 75, 75, 75).withOpacity(0.6),
                    ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
          )
          ),
        ],
      ),
    );
  }
}
