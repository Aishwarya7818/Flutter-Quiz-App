class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

//answers are shuffled but before that it is stored in diffrent list 
//final ensures that you cannot assign new list to variable
 List<String> getShuffledAnswers(){
  final shuffledList = List.of(answers);
  shuffledList.shuffle();
  return shuffledList; 

  }
}