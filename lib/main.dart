import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unnamed_app/domain/timer.dart';
import 'package:unnamed_app/screens/home.dart';
import 'package:unnamed_app/screens/register.dart';
import 'screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/signin',
      routes: {
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => ChangeNotifierProvider(
              create: (context) => TimerInfo(),
              child: const HomePage(),
            ),
      },
    );
  }
}
