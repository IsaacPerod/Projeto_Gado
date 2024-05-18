import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app/register_page.dart';
import 'package:app/input_design.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
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
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Bem-vindo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 200, // Altere para a altura desejada
                      width: 300, // Altere para a largura desejada
                      child: Image.asset(
                        'assets/logoC.png',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    InputDesign(usuarioController, 'E-mail'),
                    InputDesign(senhaController, 'Senha'),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Entrar'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 75, 75, 75),
                      ),
                    ),
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
            ]
          )
          
        )
      )
    );
  }
}
