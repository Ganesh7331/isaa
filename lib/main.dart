import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(PasswordApp());
}

class PasswordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Generator',
      theme: ThemeData(primarySwatch: Colors.deepPurple,fontFamily: GoogleFonts.lato().fontFamily),

      home: PasswordScreen(),
    );
  }
}

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  String generatedPassword = '';
  String passwordStrength = '';

  void generatePassword() {
    setState(() {
      generatedPassword = _generateRandomPassword();
    });
  }

  void checkPassword(String password) {
    // Perform your password checking logic here
    // For example, you can check if the password has a minimum length requirement
    if (password.length >= 8) {
      setState(() {
        passwordStrength = 'Strong';
      });
    } else {
      setState(() {
        passwordStrength = 'Weak';
      });
    }
  }

  String _generateRandomPassword() {
    // Generate a random password using alphanumeric characters
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    String password = '';

    for (int i = 0; i < 8; i++) {
      password += chars[random.nextInt(chars.length)];
    }

    return password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'Generated Password:',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 10,left: 70,right: 70),
              // margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text(

                    generatedPassword,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
                  ),
                ),
              )
            ),
            Container(
              margin: EdgeInsets.only(bottom: 200),
              child: ElevatedButton(
                onPressed: generatePassword,
                child: Text('Generate Password'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'Check Password:',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10,left: 20,right: 20),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter password',
                ),
                onChanged: (value) {
                  checkPassword(value);
                },
              ),
            ),
            Text(
              'Password Strength: $passwordStrength',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
