import 'package:bmi_calculator/pages/profile_page.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/pages/widgets/gender_btn.dart';
import 'package:bmi_calculator/pages/widgets/input_form.dart';
import 'package:bmi_calculator/pages/widgets/input_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController ftController = TextEditingController();
  final TextEditingController inchController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  bool isFieldBlank = false;
  String msg = '';
  bool male = false;
  bool female = true;
  bool transgender = false;
  String gender = '';
  String bmiCondition = '';
  Color bmiConditionColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: RichText(
            text: const TextSpan(style: TextStyle(height: 0.7), children: [
          TextSpan(
              text: 'BMI',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 40,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: '\nCalculator',
              style: TextStyle(color: Colors.green, letterSpacing: 1)),
        ])),
        actions: [
          Container(
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 15),
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ));
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_logo.png'),
                backgroundColor: Colors.grey,
                radius: 30,
              ),
            ),
          )
        ],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        child: male
                            ? Image.asset(
                                'assets/images/1086510155.png',
                                fit: BoxFit.cover,
                                height: 550,
                              )
                            : Image.asset(
                                'assets/images/3465367467.png',
                                fit: BoxFit.cover,
                                height: 550,
                              ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Gender
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const InputTitle(title: 'Gender'),
                                Row(
                                  children: [
                                    GenderButton(
                                        callback: () {
                                          setState(() {
                                            male = true;
                                            female = false;
                                            transgender = false;
                                          });
                                        },
                                        isSelected: male,
                                        selectedColor: Colors.green.shade100,
                                        icon: FontAwesomeIcons.mars),
                                    GenderButton(
                                        callback: () {
                                          setState(() {
                                            male = false;
                                            female = true;
                                            transgender = false;
                                          });
                                        },
                                        isSelected: female,
                                        selectedColor: Colors.green.shade100,
                                        icon: FontAwesomeIcons.venus),
                                    GenderButton(
                                        callback: () {
                                          setState(() {
                                            male = false;
                                            female = false;
                                            transgender = true;
                                          });
                                        },
                                        isSelected: transgender,
                                        selectedColor: Colors.green.shade100,
                                        icon: FontAwesomeIcons.transgender),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            //Age
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const InputTitle(title: 'Age'),
                                InputForm(
                                  width: 175,
                                  controller: ageController,
                                  hintText: '32',
                                  keyboardType: TextInputType.datetime,
                                  icon: Icon(
                                    Icons.man_rounded,
                                    color: Colors.grey.shade500,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            //height
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const InputTitle(title: 'Height (Feet)'),
                                Row(
                                  children: [
                                    InputForm(
                                      width: 82,
                                      controller: ftController,
                                      hintText: '5',
                                      icon: Icon(
                                        Icons.height,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                    InputForm(
                                      width: 82,
                                      controller: inchController,
                                      hintText: '7',
                                      icon: Icon(
                                        Icons.square_foot,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            //Weight
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const InputTitle(title: 'Weight (Kg)'),
                                InputForm(
                                  width: 175,
                                  controller: weightController,
                                  hintText: '75',
                                  icon: Icon(
                                    Icons.monitor_weight,
                                    color: Colors.grey.shade500,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                isFieldBlank
                    ? Text(msg,
                        style: const TextStyle(fontSize: 16, color: Colors.red))
                    : const SizedBox.shrink(),
                const SizedBox(height: 10),
                SizedBox(
                  width: 370,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      //get value
                      var age = ageController.text.toString();
                      var htFeet =
                          double.tryParse(ftController.text.toString());
                      var htInch =
                          double.tryParse(inchController.text.toString());
                      var weightKg =
                          double.tryParse(weightController.text.toString());

                      if (male) gender = 'Male';
                      if (female) gender = 'Female';
                      if (transgender) gender = 'Transgender';

                      if (gender.isEmpty) {
                        setState(() {
                          isFieldBlank = true;
                          msg =
                              'Gender is not selected, please select and try again!';
                        });
                        return;
                      }

                      if (age.isEmpty) {
                        setState(() {
                          isFieldBlank = true;
                          msg =
                              'Age field is blank, please fill it up and try again!';
                        });
                        return;
                      }

                      if (htFeet == null || htFeet <= 0) {
                        setState(() {
                          isFieldBlank = true;
                          msg =
                              'Height (feet) is invalid, please fill it up and try again!';
                        });
                        return;
                      }

                      if (htInch == null || htInch < 0) {
                        setState(() {
                          isFieldBlank = true;
                          msg =
                              'Height (inches) is invalid, please fill it up and try again!';
                        });
                        return;
                      }

                      if (weightKg == null || weightKg <= 0) {
                        setState(() {
                          isFieldBlank = true;
                          msg =
                              'Weight is invalid, please fill it up and try again!';
                        });
                        return;
                      }

                      setState(() {
                        isFieldBlank = false; // Clear the error message
                      });

                      //convert value
                      var heightMeet = (htFeet * 0.3048) + (htInch * 0.0254);
                      var bmi = weightKg / (heightMeet * heightMeet);

                      if (bmi >= 40.0) {
                        bmiCondition = 'Obese';
                        bmiConditionColor = Colors.red;
                      } else if (bmi >= 25.0 && bmi < 40.0) {
                        bmiCondition = 'Overweight';
                        bmiConditionColor = Colors.yellow.shade900;
                      } else if (bmi >= 18.5 && bmi < 25.0) {
                        bmiCondition = 'Normal';
                        bmiConditionColor = Colors.green;
                      } else {
                        bmiCondition = 'Underweight';
                        bmiConditionColor = Colors.yellow.shade500;
                      }

                      //set value
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            age: age,
                            score: bmi.toStringAsFixed(1),
                            condition: bmiCondition,
                            gender: gender,
                            height:
                                '${ftController.text}.${inchController.text}',
                            weight: weightController.text.toString(),
                            bmiConditionColor: bmiConditionColor,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Calculate',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
