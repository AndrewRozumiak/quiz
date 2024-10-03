import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_math/screens/result_screen.dart';
import '../models/question.dart';
import '../providers/history_provider.dart';

class QuizProvider with ChangeNotifier {
  int _currentQuestionIndex = 0;
  int _score = 0;
  final List<Question> _questions = [
    Question(
      questionText: 'What is the capital of Ukraine?',
      answers: ['Kyiv', 'Lviv', 'Odesa', 'Kharkiv'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'What is the largest planet in the Solar System?',
      answers: ['Earth', 'Mars', 'Jupiter', 'Saturn'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'How many continents are there on Earth?',
      answers: ['5', '6', '7', '8'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'What is the deepest point in the ocean?',
      answers: ['Mariana Trench', 'Challenger Deep', 'Pacific Trench', 'Tonk'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'What is the largest ocean on Earth?',
      answers: ['Indian', 'Atlantic', 'Pacific', 'Arctic'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'What is the main gas component of Earth\'s atmosphere?',
      answers: ['Oxygen', 'Carbon dioxide', 'Nitrogen', 'Argon'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Which element has the chemical formula H2O?',
      answers: ['Hydrochloric acid', 'Water', 'Hydrogen oxide', 'Hydrogen peroxide'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'How many planets are there in the Solar System?',
      answers: ['7', '8', '9', '10'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the formula for calculating the area of a circle?',
      answers: ['πr^2', '2πr', '4πr^2', 'πd'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Which planet is closest to the Sun?',
      answers: ['Mars', 'Venus', 'Mercury', 'Jupiter'],
      correctAnswerIndex: 2,
    ),
  ];

  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;

  void answerQuestion(int selectedIndex, BuildContext context) {
    if (selectedIndex == _questions[_currentQuestionIndex].correctAnswerIndex) {
      _score++;
    }
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    } else {
      Provider.of<HistoryProvider>(context, listen: false).addScore(_score);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ResultScreen()),
      );
    }
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _score = 0;
    notifyListeners();
  }
}