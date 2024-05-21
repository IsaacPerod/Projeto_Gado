import 'package:app/common/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/register_page.dart';
import 'package:app/input_design.dart';
import 'package:app/background.dart';
import 'package:app/principal_page.dart';
import 'package:app/backend/authentication.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Authentication authentication = Authentication();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 75, 75, 75).withOpacity(0.6),
      ),
      body: Background(
        child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 100, // Altere para a altura desejada
                    width: 300, // Altere para a largura desejada
                    child: Image.asset(
                      'assets/icon.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Olá, seja bem-vindo!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Input(emailController, 'E-mail'),
                  Input(senhaController, 'Senha'),

                  ElevatedButton(
                    onPressed: () {
                      botaoClicado();
                    },
                    child: Text('Entrar'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 75, 75, 75),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print('Criar um Usuário foi clicado');
                        Navigator.push(
                          context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                    },
                    child: const Text(
                      'Criar um novo Usuário',
                      style: TextStyle(
                        color: Color.fromARGB(255, 196, 196, 196),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ), 
          ), 
      )
    );
  }
  botaoClicado() {
    String email = emailController.text;
    String senha = senhaController.text;

    if (_formKey.currentState!.validate()){
      print('Form Valido!');
      print('E-mail: ${emailController.text}, Senha: ${senhaController.text}');
      authentication.logarUsuario(
        email: email, 
        senha: senha
      ).then((String? erro){
        if (erro != null){
          mostrarSnackBar(context: context, texto: erro);
        }
        else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PrincipalPage()),
          );
        };
      });
    }
  }
}
