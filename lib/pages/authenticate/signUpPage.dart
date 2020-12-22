import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  String get route => '/signUp';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _loginIsEmpty = false;
  bool _passwordIsEmpty = false;
  bool _isPassEqual = true;
  bool _confirmPassIsEmpty = false;

  void signUp() {
    setState(() {
      _loginIsEmpty = _loginController.text.isEmpty;
      _passwordIsEmpty = _passwordController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Scaffold(
            body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: [
              Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                onChanged: (String text) =>
                    setState(() => _loginIsEmpty = text.isEmpty),
                controller: _loginController,
                decoration: InputDecoration(
                  hintText: 'example@gmail.com',
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                  errorText: _loginIsEmpty ? 'This is a required field' : null,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (String text) =>
                    setState(() => _passwordIsEmpty = text.isEmpty),
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '•••••••••',
                  labelText: 'Password',
                  icon: Icon(Icons.lock),
                  errorText:
                      _passwordIsEmpty ? 'This is a required field' : null,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (String text) => setState(() {
                  _confirmPassIsEmpty = text.isEmpty;
                  _isPassEqual = text == _passwordController.text;
                }),
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '•••••••••',
                  labelText: 'Confirm password',
                  icon: Icon(Icons.lock),
                  errorText: _confirmPassIsEmpty
                      ? 'This is required field'
                      : !_isPassEqual
                          ? 'Passwords do not match'
                          : null,
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: signUp,
                child: Text(
                  'SIGN UP',
                  style: Theme.of(context).textTheme.button,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
