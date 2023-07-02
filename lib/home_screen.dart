import 'package:flutter/material.dart';
import 'package:new_words_a_day_mobile_flutter/api_call.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Map<String, dynamic>>? _lastWord;

  @override
  void initState() {
    _lastWord = fetchLastWordByLanguage("en");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
            padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 10.0),
            child: Text('Last Words',
                style: TextStyle(
                    color: Colors.green, decoration: TextDecoration.none))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _lastWord = fetchLastWordByLanguage('en');
                });
              },
              icon: const Icon(Icons.history),
              label: const Text('English'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(width: 10.0),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _lastWord = fetchLastWordByLanguage('es');
                });
              },
              icon: const Icon(Icons.history),
              label: const Text('Spanish'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
        Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
                future: _lastWord,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                            child: Text(snapshot.data['word'],
                                style: const TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 25,
                                    decoration: TextDecoration.none))),
                       SizedBox(
                          height: 550,
                          child: SingleChildScrollView(
                              child: Text(
                            snapshot.data['definition'],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal),
                          )),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return const Text("An error occured");
                  }
                  return const CircularProgressIndicator();
                })),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(bottom: 70.0),
            height: 70.0,
            decoration: BoxDecoration(
                color: const Color.fromARGB(117, 156, 177, 199),
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/words_screen');
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('New words'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 7.0), // Add spacing between buttons
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/old_words_screen',
                        arguments: {'language': 'es'});
                  },
                  icon: const Icon(Icons.history),
                  label: const Text('Spanish'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 7.0), // Add spacing between buttons
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/old_words_screen',
                        arguments: {'language': 'en'});
                  },
                  icon: const Icon(Icons.history),
                  label: const Text('English'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
