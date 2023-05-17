import 'package:bmut/constants/turkish_texts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            body: Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/startup");
                    },
                    child: const Text("Startup"))));
      },
    );
  }
}
