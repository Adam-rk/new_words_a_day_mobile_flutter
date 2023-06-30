import 'package:flutter/material.dart';
import 'package:new_words_a_day_mobile_flutter/api_call.dart';

class SpanishOldWordsScreen extends StatefulWidget {
  const SpanishOldWordsScreen({super.key});
  
  @override
  _SpanishOldWordsScreenState createState() => _SpanishOldWordsScreenState();
}

class _SpanishOldWordsScreenState extends State<SpanishOldWordsScreen> {
  Future<Map<String, dynamic>>? _apiData;

  @override
  void initState() {
    _apiData = fetchLanguages("getAllWords/es");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _apiData,
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if(snapshot.hasData) {
          return const SingleChildScrollView(
          child: Column(children: <Widget>[
            Text("OK")
          ]),
        );
        }else if (snapshot.hasError) {
            return const Text("Une erreur s'est produite");
          }
          return const CircularProgressIndicator();
      },
    );
  }
}

