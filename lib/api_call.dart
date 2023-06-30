import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Map<String, dynamic>> fetchANewWord() async {

  const ipAddress =  "10.2.5.157";
  final response = await http.get(Uri.parse("http://$ipAddress:8000/word"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Impossible de récuperer les résultats');
  }
}

Future<List<Map<String, dynamic>>> fetchOldWords(String language) async {
  const ipAddress =  "10.2.5.157";
  final response = await http.get(Uri.parse("http://$ipAddress:8000/getAllWords/$language")); 

  if (response.statusCode == 200) {
    final List<Map<String, dynamic>> data = json.decode(response.body);
    print(data);
    return data;
  } else {
    throw Exception('Impossible de récuperer les résultats');
  }
}