class QuestionModel {
  final String question;
  final List<String> options;

  QuestionModel({required this.question, required this.options});

  List<String> suffledList() {
    final sufflelist = List.of(options);
    sufflelist.shuffle();
    return sufflelist;
  }
}
