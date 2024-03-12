import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:qrbats/profile.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String apiUrl = "http://localhost:8080/api/v1/auth/authendicate"; // Replace with your API endpoint

  Future<void> _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl), // Parse the apiUrl string to Uri
        body: jsonEncode({"email": email, "password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );


      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String token = responseData['token'];
        final decodedToken = parseJwt(token);
        final String userEmail = decodedToken['sub'];

        // Navigate to profile page with userEmail
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(userEmail: userEmail),
          ),
        );

      } else {
        throw Exception('Failed to login');
      }
    } catch (error) {
      print(error);
      // Handle error here
    }
  }

  // Helper function to parse JWT token
  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = parts[1];
    final String normalized = base64Url.normalize(payload);
    final String decoded = utf8.decode(base64Url.decode(normalized));
    final Map<String, dynamic> response = json.decode(decoded);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
