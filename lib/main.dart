import 'package:flutter/material.dart';
import 'package:new_words_a_day_mobile_flutter/words_screen.dart';
import 'package:new_words_a_day_mobile_flutter/home_screen.dart';
import 'package:new_words_a_day_mobile_flutter/english_old_words_screen.dart';
import 'package:new_words_a_day_mobile_flutter/spanish_old_words_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomeScreen(),
    '/spanish_old_words_screen': (context) => const SpanishOldWordsScreen(),
    '/words_screen': (context) => WordsScreen()
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
