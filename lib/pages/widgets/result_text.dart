import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  final String title;
  final String result;

  const ResultText({super.key, required this.title, required this.result});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: '$title     ',
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          TextSpan(
              text: result,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
        ])));
  }
}
