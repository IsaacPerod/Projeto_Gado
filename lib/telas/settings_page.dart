import 'package:app/common/Navigation_Drawer.dart';
import 'package:app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:app/common/background.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final StorageService storageService = StorageService();
  final _formKey = GlobalKey<FormState>();
  final ipController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Configurações'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 75, 75, 75).withOpacity(0.6),
      ),
      drawer: const DrawerNav(),
      body: Stack(
        children: [
          Background(
            child: Container(),
          ),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.centerLeft,
                    heightFactor: 3,
                    child: Text('  Novo Ip'),
                  ),
                  const Divider(color: Color.fromARGB(255, 75, 75, 75)),
                  TextFormField(
                    controller: ipController,
                    decoration: const InputDecoration(
                      labelText: 'Digite o novo IP aqui',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o IP';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await storageService.saveIp(ipController.text);
                      }
                    },
                    child: const Text('Salvar IP'),
                  ),
                  const Divider(color: Color.fromARGB(255, 75, 75, 75)),
                  const SizedBox(height: 200),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 75, 75, 75).withOpacity(0.6),
                    ),
                    child: const Text('Voltar'),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
