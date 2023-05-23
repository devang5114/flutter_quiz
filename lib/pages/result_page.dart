import 'package:flutter/material.dart';
import 'package:flutter_journey/data/question.dart';
import 'package:flutter_journey/data/summery_data.dart';
import 'package:flutter_journey/pages/question_page.dart';
import 'package:flutter_journey/pages/home_page.dart';
import 'package:flutter_journey/widgets/custom_background.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.chooseanswers});
  final List<String> chooseanswers;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summarydata =
        getsummarydata(widget.chooseanswers);
    int correctanscount = summarydata
        .where((data) => data['user_ans'] == data['correct_ans'])
        .length;

    return Scaffold(
        body: CustomBackGround(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/animation/winer.json',
                    repeat: false,
                    height: 200,
                    animate: true,
                  ),
                  Text(
                    'Your Score\n $correctanscount / ${questions.length}',
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              PageTransition(
                                  child: HomePage(),
                                  duration: const Duration(milliseconds: 1000),
                                  type: PageTransitionType.fade),
                              (route) => false,
                            );
                          },
                          child: Text('Home')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              PageTransition(
                                  child: QuestionPage(),
                                  duration: const Duration(milliseconds: 1000),
                                  type: PageTransitionType.fade),
                              (route) => false,
                            );
                          },
                          child: Text('Restart Quiz'))
                    ],
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: SizedBox.expand(
                child: DraggableScrollableSheet(
                  initialChildSize: 0.170,
                  expand: true,
                  minChildSize: 0.1,
                  maxChildSize: 0.9,
                  builder: (context, scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          Lottie.asset(
                            'assets/animation/arrowup.json',
                            height: 50,
                          ),
                          Text(
                            'Quiz Result',
                            style: GoogleFonts.lato(
                                fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ...summarydata.map((summary) {
                            bool iscorrect =
                                summary['correct_ans'] == summary['user_ans'];
                            correctanscount =
                                iscorrect ? correctanscount++ : correctanscount;
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(21),
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.only(bottom: 10),
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: Text(
                                    '${summary['question_index']}',
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.black),
                                  ),
                                  backgroundColor: iscorrect
                                      ? Colors.green.withOpacity(.4)
                                      : Colors.redAccent.withOpacity(.4),
                                ),
                                title: Text('${summary['question']}',
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(.7))),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(),
                                    Text('C: ${summary['correct_ans']}',
                                        style: GoogleFonts.aBeeZee(
                                            fontSize: 13,
                                            color:
                                                Colors.black.withOpacity(.4))),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('${summary['user_ans']}',
                                        style: GoogleFonts.aBeeZee(
                                            fontSize: 13,
                                            color:
                                                Colors.black.withOpacity(.4)))
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
