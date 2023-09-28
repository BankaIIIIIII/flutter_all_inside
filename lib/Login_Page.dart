import 'package:flutter/material.dart';
import 'package:flutter_apk/main.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Login_IN'),
        leading: Icon(Icons.login),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  suffixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.password),
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: const Text('Login',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w900)),
            ),
          ],
        ),
      ),
    );
  }
}
