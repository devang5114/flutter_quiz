import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    Key? key,
    required this.answer,
    required this.onselectAns,
  }) : super(key: key);
  final String answer;
  final void Function() onselectAns;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(.3),
            padding: const EdgeInsets.symmetric(vertical: 19),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        onPressed: onselectAns,
        child: Text(answer,
            textAlign: TextAlign.start,
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 15)),
      ),
    );
  }
}
