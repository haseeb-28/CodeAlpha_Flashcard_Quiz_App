import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final List<Map<String, String>> flashcards;

  const QuizScreen({super.key, required this.flashcards});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int score = 0;
  int currentIndex = 0;

  void checkAnswer(String answer) {
    if (widget.flashcards.isEmpty) return;

    if (widget.flashcards[currentIndex]['answer']!.toLowerCase() ==
        answer.toLowerCase()) {
      setState(() {
        score++;
      });
    }

    setState(() {
      currentIndex = (currentIndex + 1) % widget.flashcards.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: widget.flashcards.isEmpty
          ? const Center(child: Text('No flashcards available for the quiz.'))
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.flashcards[currentIndex]['question']!,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => checkAnswer('True'),
                  child: const Text('True'),
                ),
                ElevatedButton(
                  onPressed: () => checkAnswer('False'),
                  child: const Text('False'),
                ),
                const SizedBox(height: 20),
                Text('Score: $score', style: const TextStyle(fontSize: 20)),
              ],
            ),
    );
  }
}
