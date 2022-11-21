import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:unnamed_app/utility/validator.dart';
import 'package:unnamed_app/utility/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  String? _username, _password, _confirmPassword;
  @override
  Widget build(BuildContext context) {
    final forgot = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Already have an account?"),
        TextButton(
            child: const Text("Sign in"),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/signin');
            })
      ],
    );
    doSignUp() {
      print("register");
      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();

        print(_password);
        print(_confirmPassword);
        print(_username);
        if (_password == _confirmPassword) {
          print("match");
        } else {
          print("Mismatch");
          Flushbar(
            title: 'Mismatch password',
            message: 'Please enter valid confirm password',
            duration: const Duration(seconds: 5),
          ).show(context);
          ;
        }
      } else {
        Flushbar(
          title: 'Invalid Credentials',
          message: 'Please complete the form properly',
          duration: const Duration(seconds: 5),
        ).show(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Form(
              key: formKey,
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
                    onSaved: (value) => _username = value,
                    decoration: buildInputDecoration("Email", Icons.email),
                  ),
                  const SizedBox(height: 20.0),
                  const Text("Password"),
                  const SizedBox(height: 5.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? "Please enter a password" : null,
                    onSaved: (value) => _password = value,
                    decoration: buildInputDecoration("Password", Icons.lock),
                  ),
                  const SizedBox(height: 20.0),
                  const Text("Confirm Password"),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? "Your password is required" : null,
                    onSaved: (value) => _confirmPassword = value,
                    decoration:
                        buildInputDecoration("Confirm Password", Icons.lock),
                  ),
                  const SizedBox(height: 20.0),
                  longButtons("Sign up", doSignUp),
                  const SizedBox(height: 8.0),
                  forgot
                ],
              )),
        ),
      ),
    );
  }
}
