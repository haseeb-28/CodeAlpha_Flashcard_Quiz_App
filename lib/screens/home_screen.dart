import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import 'add_flashcard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> flashcards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flashcard Quiz App')),
      body: flashcards.isEmpty
          ? const Center(
              child: Text(
                'No flashcards available. Add some!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: flashcards.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(flashcards[index]['question']!),
                );
              },
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'quiz',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizScreen(flashcards: flashcards),
                ),
              );
            },
            child: const Icon(Icons.quiz),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddFlashcardScreen(),
                ),
              );
              if (result != null) {
                setState(() {
                  flashcards.add(result);
                });
              }
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
