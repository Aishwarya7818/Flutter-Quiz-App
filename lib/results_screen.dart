//store results
//no need to manage any internal state
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chooseAnswer, required this.onRestart});

  final List<String> chooseAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() { //get SummaryData
    //Object allows all kinds of values to be stored
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'selected_answer': chooseAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      //if it is true then the data point will be kept in new list
        return data['selected_answer'] == data['correct_answer'];
    }).length;

    //  final numCorrectQuestions = summaryData
    //  .where(
    //   (data) => data['selected_answer'] == data['correct_answer'],
    //  ).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
             style: TextButton.styleFrom(
              foregroundColor: Colors.white,
             ),
             icon: const Icon(Icons.refresh),
            label: const Text('Restart Quiz!'),
            ),
            
          ],
        ),
      ),
    );
  }
}
