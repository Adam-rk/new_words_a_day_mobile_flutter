import 'package:flutter/material.dart';
import 'package:new_words_a_day_mobile_flutter/api_call.dart';

class SpanishOldWordsScreen extends StatefulWidget {
  const SpanishOldWordsScreen({Key? key}) : super(key: key);
  
  @override
  _SpanishOldWordsScreenState createState() => _SpanishOldWordsScreenState();
}

class _SpanishOldWordsScreenState extends State<SpanishOldWordsScreen> {
  Future<List<Map<String, dynamic>>>?_apiData;

  @override
  void initState() {
    _apiData = fetchOldWords("es");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _apiData,
      builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if(snapshot.hasData) {
          print(snapshot.data);
          return const SingleChildScrollView(
          child: 
          Text("ok")
        );
        }else if (snapshot.hasError) {
            return const Text("Une erreur s'est produite");
          }
          return const CircularProgressIndicator();
      },
    );
  }
}

