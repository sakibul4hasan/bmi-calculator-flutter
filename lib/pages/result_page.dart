import 'package:bmi_calculator/pages/widgets/result_text.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String score;
  final String condition;
  final String gender;
  final String age;
  final String height;
  final String weight;
  final Color bmiConditionColor;

  const ResultPage(
      {super.key,
      required this.score,
      required this.condition,
      required this.gender,
      required this.age,
      required this.height,
      required this.weight,
      required this.bmiConditionColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculation result'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'BMI Score',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueGrey),
            ),
            const SizedBox(height: 20),
            Text(
              score,
              style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: bmiConditionColor),
            ),
            Text(
              condition,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: bmiConditionColor),
            ),
            const SizedBox(height: 50),
            ResultText(title: 'Gender:', result: gender),
            ResultText(title: 'Age:', result: age),
            ResultText(title: 'Height:', result: '$height ft'),
            ResultText(title: 'Weight:', result: '$weight kg'),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.green)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 15, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Notes!',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.green),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'BMI is not used for muscle builders, long distance athletes, pregnant women.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.green.shade400),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            Container(
              width: 70,
              height: 3,
              color: Colors.grey.shade200,
            ),
            const SizedBox(height: 20),
            Text(
              'BMI Classification',
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
