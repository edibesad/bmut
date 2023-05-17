import 'package:bmut/service/device_storage.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("test")),
      body: Center(
        child: OutlinedButton(
          child: Text("Çıkış"),
          onPressed: () async {
            print(await DeviceStorage.removeUserFromStorage());
            Navigator.of(context).pushReplacementNamed("/startup");
          },
        ),
      ),
    );
  }
}
