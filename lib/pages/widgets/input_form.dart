import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final double width;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hintText;
  final Icon icon;

  const InputForm(
      {super.key,
      required this.width,
      required this.controller,
      this.keyboardType = TextInputType.number,
      required this.hintText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        width: width,
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
          textAlign: TextAlign.start,
          decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.all(15),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey.shade100,
              prefixIcon: icon,
              prefixIconConstraints:
                  BoxConstraints.tight(const Size.square(35))),
        ),
      ),
    );
  }
}
