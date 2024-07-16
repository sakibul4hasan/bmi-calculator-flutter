import 'package:flutter/material.dart';

class SettingOptions extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  const SettingOptions(
      {super.key, required this.callback, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => callback,
        child: Container(
          margin: const EdgeInsets.only(top: 30, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
