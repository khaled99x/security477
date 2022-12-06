import 'package:flutter/material.dart';
import 'package:securityproject/principal_signin.dart';
import 'package:securityproject/student_signin.dart';
import 'package:securityproject/teacher_signin.dart';

class ChoosePage extends StatefulWidget {
  const ChoosePage({super.key});

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Who are you?'),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            height: 50,
          ),
          SizedBox(
            width: 150,
            height: 40,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentSignin()),
                  );
                },
                child: const Text('Student')),
          ),
          Container(
            height: 50,
          ),
          SizedBox(
            width: 150,
            height: 40,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TeacherSignin()),
                  );
                },
                child: const Text('Teacher')),
          ),
          Container(
            height: 50,
          ),
          SizedBox(
            width: 150,
            height: 40,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrincipalSignin()),
                  );
                },
                child: const Text('Principal')),
          ),
          Container(
            height: 50,
          ),
        ],
      )),
    );
  }
}
