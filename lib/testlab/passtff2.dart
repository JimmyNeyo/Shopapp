import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String enteredText;

  const ProfilePage({super.key, required this.enteredText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Entered Text: $enteredText'),
            // Other profile information can be displayed here
          ],
        ),
      ),
    );
  }
}
