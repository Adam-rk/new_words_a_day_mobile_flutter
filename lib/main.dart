import 'package:flutter/material.dart';
import 'package:new_words_a_day_mobile_flutter/api_call.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Future<Map<String, dynamic>>? _apiData;

  @override
  void initState() {
    super.initState();

    _apiData = fetchLanguages();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: _apiData,
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            final englishInfo = snapshot.data?['english'];
            final spanishInfo = snapshot.data?["spanish"];

            final englishWord = englishInfo['word'];
            final englishDefinitions = englishInfo['definitions'];

            final spanishWord = spanishInfo['word'];
            final spanishDefinitions = spanishInfo['definitions'];

            return SingleChildScrollView(
                child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
                child: Text(englishWord,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        decoration: TextDecoration.none)),
              ),
              ...englishDefinitions
                  .map((definition) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        definition,
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      )))
                  .toList(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
                child: Text(spanishWord,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        decoration: TextDecoration.none)),
              ),
              ...spanishDefinitions
                  .map((definition) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        definition,
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      )))
                  .toList(),
            ]));
          } else if (snapshot.hasError) {
            return const Text("Une erreur s'est produite");
          }
          return const CircularProgressIndicator();
        });
  }
}

/*
  final englishInfo = snapshot.data['english'];
  final spanishInfo = snapshot.data["spanish"];

  final englishWord = englishInfo['word'];
  final englishDefinitions = englishInfo['definitions'];

  final spanishWord = spanishInfo['word'];
  final spanishDefinitions = spanishInfo['definitions'];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hello World'),
    );
  }
  */