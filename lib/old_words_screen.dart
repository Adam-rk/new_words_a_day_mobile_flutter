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
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final language = routeArguments['language'];

    _apiData = fetchOldWords(language);
    return FutureBuilder<List<dynamic>>(
      future: _apiData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              var word = snapshot.data[index];
              return Card(
                elevation: 2.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                color: Colors.greenAccent,
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/view_word',
                        arguments: {'id': word['id']});
                  },
                  title: Text(
                    word['word'],
                    style:
                        const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Text("An error occured");
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
