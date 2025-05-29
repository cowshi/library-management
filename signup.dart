import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> signUp() async {
    final response = await http.post(
      Uri.parse('http://92.205.109.210:8070/api/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': nameController.text.trim(),
        'pwd': passwordController.text.trim(),
        'gender': genderController.text.trim(),
        'mail': emailController.text.trim(),
      }),
    );

    if (response.statusCode == 200) {
      Navigator.pop(context); // Return to login
    } else {
      showMessage("Sign Up Failed: ${response.body}");
    }
  }

  void showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Sign Up"), backgroundColor: Colors.pink[50]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Username")),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            TextField(controller: genderController, decoration: InputDecoration(labelText: "Gender")),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: signUp, child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
