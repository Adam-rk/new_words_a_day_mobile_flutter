import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
  alignment: Alignment.bottomCenter,
  child: Container(
    margin: const EdgeInsets.only(bottom: 70.0),
    height: 70.0,
    decoration: BoxDecoration(
      color: const Color.fromARGB(117, 156, 177, 199),
      borderRadius: BorderRadius.circular(10.0)
    ),
    
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
);

  }
}
