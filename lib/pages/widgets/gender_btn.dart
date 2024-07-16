import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderButton extends StatelessWidget {
  final VoidCallback callback;
  final bool isSelected;
  final IconData icon;
  final Color selectedColor;
  final Color unselectedColor;

  const GenderButton({
    super.key,
    required this.callback,
    required this.isSelected,
    required this.icon,
    this.selectedColor = Colors.green,
    this.unselectedColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? selectedColor : unselectedColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FaIcon(
              icon,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
