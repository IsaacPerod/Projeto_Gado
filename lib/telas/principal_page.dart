import 'package:app/services/api_service.dart';
import 'package:app/services/storage_service.dart';
import 'package:app/telas/dados_page.dart';
import 'package:flutter/material.dart';
import 'package:app/common/background.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  final ApiService apiService = ApiService();
  final StorageService storageService = StorageService();
  List<dynamic> dados = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadLocalData();
  }

  Future<void> loadLocalData() async {
    final localDados = await storageService.loadDados();
    setState(() {
      dados = localDados;
    });
  }

  Future<void> fetchDataFromApi() async {
  setState(() {
    isLoading = true;
  });
  try {
    final apiDados = await apiService.getDados();
    setState(() {
      dados = apiDados;
    });
    storageService.saveDados(apiDados);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DataPage(dados: apiDados),
      ),
    );
  } catch (e) {
    // Print the exception to the console
    print(e);
    // Handle the error, for example show a message to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to load data from API')),
    );
  } finally {
    setState(() {
      isLoading = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sincronizar Dados'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 75, 75, 75).withOpacity(0.6),
      ),
      body: Stack(
        children: [
          Background(
            child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.0), // Ajuste este valor para mover o botão para cima ou para baixo
              child: ElevatedButton(
                onPressed: fetchDataFromApi,
                child: const Text('Sincronizar'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 75, 75, 75).withOpacity(0.6)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
