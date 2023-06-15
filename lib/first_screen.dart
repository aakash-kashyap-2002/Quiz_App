import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{

  //constructor
  const StartScreen( this.startQuiz , {super.key});

  final void Function() startQuiz;

  @override
  Widget build( context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min ,
        children: [

          // Image.asset('assets/evfi_logo.png',
          // width: 250,
          // color: const Color.fromARGB(150, 255, 255, 255),
          // ),

          Opacity(
            opacity: 0.7,
            child: Image.asset('assets/evfi_logo.png',
            width: 250,
            ),
          ),

          const SizedBox(height: 80),

          Text('Learn Flutter the fun way!',
          style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 240, 209, 209),
              fontSize: 24,
          ) ,
         ),

          const SizedBox(height: 80),

          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz')
           ),

        ],
       ),
      );
  }

}