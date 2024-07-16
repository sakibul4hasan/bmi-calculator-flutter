import 'package:bmi_calculator/pages/widgets/setting_option.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_logo.png'),
                radius: 50,
              ),
            ),
            const Text(
              'Sakibul Hasan',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const Text(
              'Male, 22 years old',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 50),
            //
            SettingOptions(callback: () {}, title: 'Account Info'),
            SettingOptions(callback: () {}, title: 'BMI History '),
            SettingOptions(callback: () {}, title: 'Setting        '),
            //
            const SizedBox(height: 100),
            SizedBox(
              width: 370,
              height: 60,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    elevation: 10,
                    shadowColor: Colors.grey.shade100,
                    side: BorderSide(color: Colors.grey.shade600, width: 1.5)),
                child: const Text('Log Out',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(185, 0, 0, 0))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
