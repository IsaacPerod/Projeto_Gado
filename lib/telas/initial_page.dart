import 'package:app/telas/ip_page.dart';
import 'package:app/telas/principal_page.dart';
import 'package:flutter/material.dart';
import 'package:app/common/background.dart';
import 'package:app/services/storage_service.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  final StorageService storageService = StorageService();

  @override
  void initState() {
    super.initState();
    checkLoginAndIp();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IpPage()), // Substitua NextPage pela página que você quer navegar
      );
    });
  }

  Future<void> checkLoginAndIp() async {
    bool isLoggedIn = await storageService.getLoginState();
    String ip = await storageService.getIp();

    if (isLoggedIn && ip.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PrincipalPage()), // Substitua MainPage pela página principal do seu aplicativo
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200, // Altere para a altura desejada
                        width: 300, // Altere para a largura desejada
                        child: Image.asset(
                          'assets/logo_nome_Bk.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(
                        height: 200, // Altere para a altura desejada
                        width: 300, // Altere para a largura desejada
                        child: Image.asset(
                          'assets/iconBk.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const SizedBox(height: 40),
                      
                    ],
                  ),
                  
                )
              ]
            )
          )
        )
      )
    );
  }
}
