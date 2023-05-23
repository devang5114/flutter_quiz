import 'package:flutter_journey/data/question.dart';

List<Map<String, Object>> getsummarydata(List<String> chooseAnswers) {
  final List<Map<String, Object>> summery = [];
  for (int i = 0; i < questions.length; i++) {
    summery.add({
      'question_index': i + 1,
      'question': questions[i].question,
      'correct_ans': questions[i].options[0],
      'user_ans': chooseAnswers[i],
    });
  }
  return summery;
}
