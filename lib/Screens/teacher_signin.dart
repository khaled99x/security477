import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:securityproject/DatabaseServices/auth.dart';
import 'package:securityproject/Screens/principal_home.dart';
import 'package:securityproject/Screens/teacher_home.dart';

class TeacherSignin extends StatefulWidget {
  const TeacherSignin({super.key});

  @override
  State<TeacherSignin> createState() => _TeacherSigninState();
}

class _TeacherSigninState extends State<TeacherSignin> {
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

  Future<bool> userExist() async {
    String? id = Auth().currentUser!.uid;
    var collection = FirebaseFirestore.instance.collection('Teacher');
    var docSnapshot = await collection.doc(id).get();
    if (docSnapshot.exists) {
      return true;
    }
    return false;
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
                      enableSuggestions: false,
                      autocorrect: false,
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
                              if (await userExist())
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TeacherHome()),
                                );
                              else {
                                setState(() {
                                  error = "User does not exist";
                                });
                              }
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
