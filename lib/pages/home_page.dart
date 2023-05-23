import 'package:flutter/material.dart';
import 'package:flutter_journey/pages/question_page.dart';
import 'package:flutter_journey/widgets/custom_background.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackGround(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 120),
              Animate(
                effects: [
                  FadeEffect(
                      duration: Duration(
                        milliseconds: 1000,
                      ),
                      curve: Curves.fastOutSlowIn),
                ],
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/images/intro1.png',
                      height: 100, color: Colors.white),
                ),
              ),
              const SizedBox(height: 170),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Colors.deepPurple.withOpacity(.3)),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    PageTransition(
                        child: QuestionPage(),
                        duration: const Duration(milliseconds: 1000),
                        type: PageTransitionType.fade),
                    (route) => false,
                  );
                },
                child: const Text(
                  'Lets get Started',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
