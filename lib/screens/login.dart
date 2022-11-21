import 'package:flutter/material.dart';
import 'package:unnamed_app/utility/validator.dart';
import 'package:unnamed_app/utility/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late String _username, _password;
  @override
  Widget build(BuildContext context) {
    final forgot = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Forgot Password"),
        TextButton(
            child: const Text("Register"),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/signup');
            })
      ],
    );
    doSignIn() {
      Navigator.pushReplacementNamed(context, '/home');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15.0),
              const Text("Email"),
              const SizedBox(height: 5.0),
              TextFormField(
                autofocus: false,
                validator: (value) {
                  return validateEmail(value!);
                },
                onSaved: (value) => _username,
                decoration: buildInputDecoration("Email", Icons.email),
              ),
              const SizedBox(height: 20.0),
              const Text("Password"),
              const SizedBox(height: 5.0),
              TextFormField(
                autofocus: false,
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? "Please enter a passowrd" : null,
                onSaved: (value) => _password,
                decoration: buildInputDecoration("Password", Icons.lock),
              ),
              const SizedBox(height: 20.0),
              longButtons("Login", doSignIn),
              const SizedBox(height: 8.0),
              forgot
            ],
          )),
        ),
      ),
    );
  }
}
