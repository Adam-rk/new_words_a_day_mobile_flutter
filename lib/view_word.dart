import 'package:flutter/material.dart';
import 'package:new_words_a_day_mobile_flutter/api_call.dart';

class ViewWord extends StatefulWidget {
  const ViewWord({Key? key}) : super(key: key);

  @override
  _ViewWordState createState() => _ViewWordState();
}

class _ViewWordState extends State<ViewWord> {
  Future<Map<String, dynamic>>? _apiData;

  @override
  void initState() {
    _apiData = fetchWordById(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final wordId = routeArguments['id'];

    _apiData = fetchWordById(wordId);
    return FutureBuilder<Map<String, dynamic>>(
      future: _apiData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return SingleChildScrollView(
              child: Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Text(data['word'],
                    style: const TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 25,
                        decoration: TextDecoration.none))),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text(data['definition'],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal)))
          ]));
        } else if (snapshot.hasError) {
          return const Text("An error occured");
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
