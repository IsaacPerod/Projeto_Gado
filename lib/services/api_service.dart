import 'dart:convert';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';

class ApiService{
  ApiService();
  
  String baseUrl = '';

  /* void getIp() async {
    final String ipv4 = await Ipify.ipv64();
    baseUrl = 'http://$ipv4:5000';
  } */

  /* void getIpWifi() async{

    final info = NetworkInfo();

    final ipv4 = await info.getWifiIP();
    baseUrl = 'http://$ipv4:5000';
    print(baseUrl);
    
  } */


  void setBaseUrl(String ip) {

    baseUrl = 'http://$ip:5000';
    print(baseUrl);
  }

  String getBaseUrl() {
    return baseUrl;
  }


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
