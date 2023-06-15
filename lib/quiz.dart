import 'package:flutter/material.dart';
import 'package:third_project/data/questions.dart';
import 'package:third_project/first_screen.dart';
import 'package:third_project/question_screen.dart';
import 'package:third_project/results_screen.dart';

class Quiz extends StatefulWidget {
  //constructor
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //this list of selected answers by user
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chosenAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chosenAnswers);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 40, 12, 74),
                Color.fromARGB(255, 57, 18, 103),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
