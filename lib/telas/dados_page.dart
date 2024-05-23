import 'package:app/common/background.dart';
import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  final List<dynamic> dados;

  DataPage({required this.dados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dados de Pesagem'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 75, 75, 75).withOpacity(0.6),
      ),
      body: Stack(
        children: [
          Background(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 65, 10, 10), // Adiciona margem ao Container
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0), // Adiciona bordas arredondadas ao Container
              ),
              child: Padding( // Adiciona margem ao ListView.builder
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0), // Diminui a margem superior
                child: ListView.separated(
                  itemCount: dados.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('ID: ${dados[index]['id']}'),
                      subtitle: Text('Peso: ${dados[index]['peso']} kg'),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(); // Adiciona uma linha divisória
                  },
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
