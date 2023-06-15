import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(
                  ((data['question_index'] as int) + 1).toString(), 
                  style: GoogleFonts.lato(color: const Color.fromARGB(255, 169, 46, 46)),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
                    color: Colors.black,
                    child: Column(children: [
                      Text(
                        data['question'] as String, 
                        style: GoogleFonts.lato(color: const Color.fromARGB(255, 193, 218, 70)),
                        ),
                      const SizedBox(height: 5),
                      Text(
                        data['user_answer'] as String , 
                        style: GoogleFonts.lato(color: const Color.fromARGB(255, 102, 20, 80),)
                        ),
                      Text(
                        data['correct_answer'] as String , 
                        style: GoogleFonts.lato(color: const Color.fromARGB(255, 79, 134, 37),)
                        ),
                    ],),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
