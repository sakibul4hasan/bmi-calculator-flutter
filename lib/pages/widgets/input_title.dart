import 'package:flutter/material.dart';

class InputTitle extends StatelessWidget {
  final String title;
  const InputTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600)));
  }
}
