import 'package:flutter/material.dart';
import 'package:new_words_a_day_mobile_flutter/api_call.dart';

class OldWordsScreen extends StatefulWidget {
  const OldWordsScreen({Key? key}) : super(key: key);

  @override
  _OldWordsScreenState createState() => _OldWordsScreenState();
}

class _OldWordsScreenState extends State<OldWordsScreen> {
  Future<List<dynamic>>? _apiData;

  
  @override
  void initState() {
    _apiData = fetchOldWords("es");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final language = routeArguments['language'];

    _apiData = fetchOldWords(language);
    return FutureBuilder<List<dynamic>>(
      future: _apiData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
                children: snapshot.data
                    .map((word) => TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/view_word', arguments: {'id': word['id']});
                          },
                          child: Text(word['word']),
                        ))
                    .toList()
                    .cast<Widget>()),
          );
        } else if (snapshot.hasError) {
          return const Text("Une erreur s'est produite");
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
