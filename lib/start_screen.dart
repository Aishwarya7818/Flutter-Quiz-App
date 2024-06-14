import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {

  const StartScreen(this.startQuiz,{super.key}); //this key argument has to be forwarded to stateless widget, hence we use super
  final void Function() startQuiz; //is set value passed as argument in startscreen
  
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/quiz_logo.png',
              width: 200,
            ),
          ),
          const SizedBox(height: 80),
          const Text(
            "Learn Flutter Fun Way!!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}


