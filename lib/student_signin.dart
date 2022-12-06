import 'package:flutter/material.dart';

class StudentSignin extends StatefulWidget {
  const StudentSignin({super.key});

  @override
  State<StudentSignin> createState() => _StudentSigninState();
}

class _StudentSigninState extends State<StudentSignin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          child: Column(
            children: [
              Container(
                height: 40,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              Container(
                height: 40,
              ),
              SizedBox(
                height: 50,
                width: 140,
                child: ElevatedButton(
                    onPressed: () {
                      // TODO: Connect DB
                    },
                    child: Text("Log in")),
              )
            ],
          ),
        ),
      )),
    );
  }
}
