import 'package:flutter/material.dart';
import 'package:securityproject/Screens/choose_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Security Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WELCOME'),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            height: 50,
          ),
          SizedBox(
              height: 200, width: 200, child: Image.asset('assets/aca.png')),
          Container(
            height: 50,
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
                    MaterialPageRoute(builder: (context) => const ChoosePage()),
                  );
                },
                child: const Text('LOGIN')),
          ),
          Container(
            height: 50,
          ),
        ],
      )),
    );
  }
}
