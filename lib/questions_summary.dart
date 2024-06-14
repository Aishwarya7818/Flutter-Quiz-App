import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  // final bool isCorrectanswer;
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        //makes the child scrollable
        child: Column(
            children: summaryData.map((data) {
          //return widget to which data should be mapped
          final isCorrectanswer = data['selected_answer'] == data['correct_answer'];
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                        color: isCorrectanswer ? const Color.fromARGB(255,150,198,241,) : const Color.fromARGB(255, 249, 133, 241),
                    
                  ),
                  child: Center(
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(color: Color.fromARGB(255, 8, 19, 137),
                      fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                //used to keep everything in screen
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //text is aligned
                  children: [
                    Text(
                      data['question'] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(data['selected_answer'] as String,style: TextStyle(
                      color: const Color.fromARGB(255, 162, 199, 216),
                    ),),
                    Text(data['correct_answer'] as String,
                    style: TextStyle(
                      color: Colors.lightBlue,
                    ),),
                  ],
                ),
              ),
            ],
          );
        }).toList()),
      ),
    );
  }
}
