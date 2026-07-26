import 'package:flutter/material.dart';

class ProfileSetupPage extends StatelessWidget {
  final String name;
  final String email;

  const ProfileSetupPage({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Setup"),
      ),
      body: Center(
        child: Text(
          "Welcome $name\n$email",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}