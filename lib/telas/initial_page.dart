import 'package:app/common/input_design.dart';
import 'package:flutter/material.dart';
import 'package:app/telas/login_page.dart';
import 'package:app/common/background.dart';
import 'package:app/services/api_service.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  final _formKey = GlobalKey<FormState>();
  final ipController = TextEditingController();
  final ApiService apiService = ApiService();
  

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
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Input(ipController, 'Digite o endereço de IP do servidor'),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      apiService.setBaseUrl(ipController.text);
                                    });
                                    print(apiService.getBaseUrl());
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                  }
                                },
                                child: Text('Começar'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: const Color.fromARGB(255, 75, 75, 75),
                                ),
                              ),
                          ],
                        ),
                              
                      ),
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
