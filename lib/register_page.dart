import 'package:flutter/material.dart';
import 'package:app/input_design.dart';
import 'package:app/background.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();
  final emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Cadastro'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 75, 75, 75).withOpacity(0.6),
      ),
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InputDesign(usuarioController, 'Nome'),
                  InputDesign(emailController, 'E-mail'),
                  InputDesign(senhaController, 'Senha'),
                  
                  SizedBox(height: 40,),

                  ElevatedButton(
                    onPressed: () {
                      // Adicione a lógica do botão aqui
                    },
                    child: const Text('Cadastrar'),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 75, 75, 75),
                      ),
                  ),
                ],
        ),
      ),
    );
  }
}  