import 'package:bmut/view_model/main_view_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        MainViewModel.navigateChecker(context,
            onSuccess: () =>
                Navigator.of(context).pushReplacementNamed("/test"),
            onFail: () =>
                Navigator.of(context).pushReplacementNamed("/startup"));
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
