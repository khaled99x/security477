import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:securityproject/DatabaseServices/auth.dart';
import 'package:securityproject/Screens/Home.dart';

class StudentSignin extends StatefulWidget {
  const StudentSignin({super.key});

  @override
  State<StudentSignin> createState() => _StudentSigninState();
}

class _StudentSigninState extends State<StudentSignin> {
  String? error = "";

  bool loading = false;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<bool> signIn() async {
    bool signedIn = false;
    try {
      await Auth().signIn(
          email: _controllerEmail.text, password: _controllerPassword.text);
      setState(() {
        signedIn = true;
      });
      return signedIn;
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message;
      });
      return signedIn;
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Sign In'),
            ),
            body: Center(child: CircularProgressIndicator()))
        : Scaffold(
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
                      child: const Text(
                        "Email",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _controllerEmail,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Password",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _controllerPassword,
                      decoration: const InputDecoration(
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
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            var signedIn = await signIn();
                            setState(() {
                              loading = false;
                            });
                            if (signedIn) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                              );
                            }
                          },
                          child: const Text("Log in")),
                    ),
                    Container(
                      height: 30,
                    ),
                    Text(
                      error.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
            )),
          );
  }
}
