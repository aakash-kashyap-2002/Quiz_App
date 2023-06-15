
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:third_project/data/questions.dart';
//import 'package:third_project/quiz.dart';

import 'package:third_project/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  //constructor
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summarydata = getSummaryData();
    final noOfTotalQuestion = questions.length;
    final noOfCorrectQuestions = summarydata.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $noOfCorrectQuestions out of $noOfTotalQuestion questions correctly!', 
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 17,
                ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: summarydata),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: (){},
              child: const Text('restart quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
