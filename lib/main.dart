import 'package:flutter/material.dart';
import 'package:new_words_a_day_mobile_flutter/view_word.dart';
import 'package:new_words_a_day_mobile_flutter/words_screen.dart';
import 'package:new_words_a_day_mobile_flutter/home_screen.dart';

import 'package:new_words_a_day_mobile_flutter/old_words_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomeScreen(),
    '/old_words_screen': (context) => const OldWordsScreen(),
    '/words_screen': (context) => WordsScreen(),
    '/view_word': (context) => const ViewWord()
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Words',
      routes: routes,
      initialRoute: '/',
    );
  }
}
