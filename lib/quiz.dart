import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key}); //constructor fun
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {  //_ implies private used only in particular file
//Widget? activescreen; //can store widgets in variables (Should be added before override)
//Error: both variables and method creation happens at the same point of time

  List<String> selectedAnswers = []; //list of answers choosen by users
  var activescreen = 'start-screen';
  // void initState() {
  //   //to do some extra initialization work when the state object is created for first time
  //   activescreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      //when this method is called flutter will re-execute build method
      activescreen =
          'questions-screen'; //override value stored at activescreen with question screen
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      //To make sure we don't get error when questions are completed
      setState(() {
        activescreen = 'results-screen';
      });
    }
  }

   void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activescreen= 'questions-screen';
    });
   }
  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activescreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectedAnswer: chooseAnswer,
      ); //pass chooseAnswer as value to QuestionsScreen and in QuestionScreen we must now accept this function
    }

    if (activescreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chooseAnswer: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 56, 4, 145),
              Color.fromARGB(255, 96, 55, 210),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: screenWidget,
        ),
      ),
    );
  }
}


//Lifting state up connects the switchscreen function to button