// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_journey/widgets/custom_background.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter_journey/pages/result_page.dart';

import '../data/question.dart';
import '../widgets/answer_btn.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late PageController pageController;
  List<String> answers = [];

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackGround(
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: questions.length,
          itemBuilder: (context, pageindex) {
            return QuestionPage(pageindex, context);
          },
        ),
      ),
    );
  }

  Widget QuestionPage(int index, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(25),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 150,
                ),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(questions[index].question,
                      style: GoogleFonts.roboto(
                          color: Colors.white, fontSize: 20)),
                ),
                const SizedBox(
                  height: 40,
                ),
                ...questions[index].suffledList().map(
                      (answer) => AnswerButton(
                        answer: answer,
                        onselectAns: () {
                          answerQuestion(
                              context: context,
                              pageindex: index,
                              answer: answer);
                        },
                      ),
                    )
              ]
                  .animate()
                  .fade(duration: Duration(milliseconds: 500))
                  .flip(alignment: Alignment.bottomCenter)
                  .moveY(
                      begin: 100, end: 0, duration: Duration(milliseconds: 300))
                  .blur(
                      begin: Offset(30, 50),
                      duration: Duration(milliseconds: 500))),
        ));
  }

  answerQuestion(
      {required BuildContext context,
      required int pageindex,
      required String answer}) {
    if (pageindex >= questions.length - 1) {
      print(answers);
      answers.add(answer);
      Navigator.of(context).pushAndRemoveUntil(
        PageTransition(
            child: ResultPage(chooseanswers: answers),
            duration: const Duration(milliseconds: 1000),
            type: PageTransitionType.fade),
        (route) => false,
      );
      answers = [];
    } else {
      answers.add(answer);
      pageController.nextPage(
          duration: const Duration(milliseconds: 700),
          curve: Curves.fastOutSlowIn);
    }
  }
}
