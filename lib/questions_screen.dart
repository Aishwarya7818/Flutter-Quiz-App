import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer}); //constructor fun

final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

var currentQuestionIndex = 0;
void answerQuestion(String selectedAnswer){
  widget.onSelectedAnswer(selectedAnswer);    //widget. gives you acces to statefulwidget functions
  setState((){ //call build mtd again
     currentQuestionIndex = currentQuestionIndex +1;

  });
 
}


  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, //items stretch out to be as wide as possible
          children: [
             Text(
              currentQuestion.text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight : FontWeight.bold,
                ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
           ),
            //map allows to transform values in list to other values, it does not change the original list
            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(
                answerText: answer,
               onTap: (){
                answerQuestion(answer);
               },);  //convert to list of strings to list of answer buttons (widgets)
            }),
          ],
        ),
      ),
    );
  }
}


//Hardcoding answers is not good idea so we will do dynamically
//convert strings to widgets and to widgets that can use this strings
//Map does not change the original list but shuffle does