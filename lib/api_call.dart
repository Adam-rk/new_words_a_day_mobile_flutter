import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Map<String, dynamic>> fetchLanguages(String option) async {

  const ipAddress =  "10.2.5.157";
  final response = await http.get(Uri.parse("http://$ipAddress:8000/$option"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    print(data);
    return data;
  } else {
    throw Exception('Impossible de récuperer les résultats');
  }
}