import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app/home_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200, // Altere para a altura desejada
                    width: 300, // Altere para a largura desejada
                    child: Image.asset(
                      'assets/logo_nome.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 200, // Altere para a altura desejada
                          width: 300, // Altere para a largura desejada
                          child: Image.asset(
                            'assets/icon.png',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const Text(
                          'Começar',
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 24,
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
    );
  }
}
