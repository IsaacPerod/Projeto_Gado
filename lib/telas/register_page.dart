import 'package:app/backend/authentication.dart';
import 'package:app/common/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/common/input_design.dart';
import 'package:app/common/background.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  Authentication authentication = Authentication();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cadastro'),
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                      Input(usuarioController, 'Nome'),
                      Input(emailController, 'E-mail'),
                      Input(senhaController, 'Senha'),
                      
                      const SizedBox(height: 40,),

                      ElevatedButton(
                        onPressed: () {
                          botaoClicado();
                          //Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color.fromARGB(255, 75, 75, 75),
                          ),
                        child: const Text('Cadastrar'),
                      ),
                    ],
            ),
          ),
        )
      ),
    );
  }
  botaoClicado() {
    String nome = usuarioController.text;
    String email = emailController.text;
    String senha = senhaController.text;

    if (_formKey.currentState!.validate()){
      print('Form Valido!');
      print('Nome: ${usuarioController.text}, E-mail: ${emailController.text}, Senha: ${senhaController.text}');
      authentication.cadastrarUsuario(
        nome: nome,
        email: email,
        senha: senha,
      ).then((String? erro){
        if (erro != null){
          mostrarSnackBar(context: context, texto: erro);
        }
        else {
        mostrarSnackBar(context: context, texto: 'Usuário cadastrado com sucesso!', isErro: false);
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pop(context);
          });
        });
      }
    });
    return true;
    }
    else {
      print('Form Invalido!');
      return false;
    }
  }
}  