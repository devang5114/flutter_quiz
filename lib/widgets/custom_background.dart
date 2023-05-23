// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomBackGround extends StatelessWidget {
  const CustomBackGround({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: SweepGradient(colors: [
        Colors.black,
        Color(0xFF693CB8),
      ])),
      child: child,
    );
  }
}
