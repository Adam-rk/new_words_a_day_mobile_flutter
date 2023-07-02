import 'dart:convert';
import 'package:http/http.dart' as http;

const ipAddress =  "192.168.0.23";
Future<Map<String, dynamic>> fetchANewWord() async {

  
  final response = await http.get(Uri.parse("http://$ipAddress:8000/word"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    return data;
  } else {
    throw Exception("Can't fetch data");
  }
}

Future<List<dynamic>> fetchOldWords(String language) async {
  
  final response = await http.get(Uri.parse("http://$ipAddress:8000/getAllWords/$language")); 
  

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception("Can't fetch data");
  }
}

Future<Map<String, dynamic>> fetchWordById(int id) async {

  final response = await http.get(Uri.parse("http://$ipAddress:8000/getWord/$id")); 
  
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception("Can't fetch data");
  }
}

Future<Map<String, dynamic>> fetchLastWordByLanguage(String language) async {

  final response = await http.get(Uri.parse("http://$ipAddress:8000/getLastWordByLanguage/$language")); 
  
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception("Can't fetch data");
  }
}