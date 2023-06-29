import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Map<String, dynamic>> fetchLanguages() async {

  const ipAddress =  "192.168.0.34";
  final response = await http.get(Uri.parse("http://$ipAddress:8000/word"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Impossible de récuperer les résultats');
  }
}