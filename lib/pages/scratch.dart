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

      debugShowCheckedModeBanner: false,
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
  String genPassword='Generate Password';

  void generatePassword() {
    setState(() {
      generatedPassword = _generateRandomPassword();
      genPassword='Generated Password';

    });
  }
  bool validateStructure(String passwordStrength){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(passwordStrength);
  }
  void checkPassword(String password) {
    // Perform your password checking logic here
    // For example, you can check if the password has a minimum length requirement
    if (validateStructure(password)) {
      setState(() {
        passwordStrength = 'Strong';
      });
    }else if(password.length<8){
      setState(() {

        passwordStrength="Length should be at least 8";
      });

    }else if(!validateStructure(password)){
      setState(() {
        passwordStrength="Lowercase, Special Symbol, Number  missing";
      });
    }

    else {
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
        title: Text('          Password Generator and Checker'
          ,textAlign: TextAlign.center,),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                margin: EdgeInsets.only(bottom:5,left: 20,right: 20),
                // margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(

                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,color: Colors.grey
                        )
                    ),

                    label: Text(

                      generatedPassword,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,) ,
                    ),
                  ),
                )
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: generatePassword,
                child: Text(genPassword),
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
              ' $passwordStrength',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
