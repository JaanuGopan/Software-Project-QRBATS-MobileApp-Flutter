import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userEmail;

  ProfilePage({required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Email: $userEmail',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
