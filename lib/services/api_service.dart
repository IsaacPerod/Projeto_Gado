import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:5000';

  Future<List<Map<String, dynamic>>> getDados() async {
    final response = await http.get(Uri.parse('$baseUrl/dados'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data is List) {
        return data.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Data is not a list of maps');
      }
    } else {
      throw Exception('Failed to load dados');
    }
  }

  Future<void> addDados(Map<String, dynamic> dado) async {
    final response = await http.post(
      Uri.parse('$baseUrl/dados'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(dado),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add dado');
    }
  }
}
