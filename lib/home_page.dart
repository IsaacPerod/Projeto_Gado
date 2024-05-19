import 'package:flutter/material.dart';
import 'package:app/register_page.dart';
import 'package:app/input_design.dart';
import 'package:app/background.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Login'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 75, 75, 75).withOpacity(0.6),
      ),
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              height: 200, // Altere para a altura desejada
              width: 300, // Altere para a largura desejada
              child: Image.asset(
                'assets/logoC.png',
                fit: BoxFit.scaleDown,
              ),
            ),
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
              onPressed: () {},
              child: Text('Entrar'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 75, 75, 75),
              ),
            ),
            const SizedBox(width: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    print('Criar um Usuário foi clicado');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: const Text(
                    'Criar um Usuário',
                    style: TextStyle(
                      color: Color.fromARGB(255, 196, 196, 196),
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                InkWell(
                  onTap: () {
                    print('Esqueci minha Senha foi clicado');
                    // Adicione a ação que você deseja executar aqui
                  },
                  child: const Text(
                    'Esqueci minha Senha',
                    style: TextStyle(
                      color: Color.fromARGB(255, 196, 196, 196),
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),  
      )
    );
  }
}
