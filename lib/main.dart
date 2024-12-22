import 'package:flashcard_quiz_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlashcardQuizApp());
}

class FlashcardQuizApp extends StatelessWidget {
  const FlashcardQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashcard Quiz App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
