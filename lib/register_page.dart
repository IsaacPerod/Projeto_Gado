import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app/input_design.dart';

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
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AppBar(
                title: const Text('Criar novo Usuário'),
                backgroundColor: Color.fromARGB(255, 184, 183, 183),
                elevation: 0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/cow.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.5),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Column(
                children: <Widget>[
                  InputDesign(usuarioController, 'Nome'),
                  InputDesign(emailController, 'E-mail'),
                  InputDesign(senhaController, 'Senha'),
                  
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

            ],
          ),
        ),
      ),
    );
  }
}  