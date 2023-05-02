import 'package:bmut/constants/turkish_strings.dart';
import 'package:bmut/register/register_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight;
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {}, child: const Text(TurkishStrings.login)),
                SizedBox(
                  height: height * .01,
                ),
                const Text(TurkishStrings.or),
                SizedBox(
                  height: height * .01,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: const Text(TurkishStrings.register))
              ],
            ),
          ),
        );
      },
    );
  }
}
