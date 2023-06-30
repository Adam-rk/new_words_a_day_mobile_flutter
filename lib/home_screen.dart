import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(0.0, 300.0, 0.0, 15.0), child: Column(children: <Widget>[
      
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/words_screen');
          },
          child: const Text('Nouveaux mots'),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/old_words_screen', arguments: {'language': 'es'});
          },
          child: const Text('Voir tous les mots espanols'),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/old_words_screen', arguments: {'language': 'en'});
          },
          child: const Text('Voir tous les mots anglais'),
        )
      ]));
  }
}
