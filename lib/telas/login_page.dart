import 'package:app/common/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/telas/register_page.dart';
import 'package:app/common/input_design.dart';
import 'package:app/common/background.dart';
import 'package:app/telas/principal_page.dart';
import 'package:app/services/authentication.dart';
import 'package:app/services/storage_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Authentication authentication = Authentication();
  StorageService storageService = StorageService();
  
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
                      'assets/icon_vaz_Bk.png',
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
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 75, 75, 75),
                    ),
                    child: const Text('Entrar'),
                  ),
                  TextButton(
                    onPressed: () {
                      print('Criar um Usuário foi clicado');

                      // Limpa os campos
                      emailController.clear();
                      senhaController.clear();

                      Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
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
      //print('Form Valido!');
      //print('E-mail: ${emailController.text}, Senha: ${senhaController.text}');
      authentication.logarUsuario(
        email: email, 
        senha: senha
      ).then((String? erro){
        if (erro != null){
          mostrarSnackBar(context: context, texto: erro);
        }
        else {
          storageService.saveLoginState();
          print('login salvo.');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PrincipalPage()),
          );
        }
      });
    }
  }
}
