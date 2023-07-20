import 'package:cheapp_and_tasty/auth/pages/sign_in_page.dart';
import 'package:cheapp_and_tasty/auth/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      // home: const MyHomePage(),
      // home: const SignInPage(),
      home: const SignUpPage(),
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
        title: const Text('app title'),
      ),
      body: Center(
        child: Text(
          'Body',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
