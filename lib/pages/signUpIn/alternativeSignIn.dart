import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/bluredGradient.dart';

class SignInPageAlternative extends StatelessWidget {
  const SignInPageAlternative({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: BluredGradient(
          child: SignInContainer(),
        ));
  }
}

class SignInContainer extends StatefulWidget {
  const SignInContainer({
    Key key,
  }) : super(key: key);

  @override
  _SignInContainerState createState() => _SignInContainerState();
}

class _SignInContainerState extends State<SignInContainer> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loginIsEmpty = false;
  bool _passwordIsEmpty = false;

  void register() {
    print('register');
  }

  void forgotPassword() {
    print('forgot password');
  }

  void signIn() {
    setState(() {
      _loginController.text.isEmpty
          ? _loginIsEmpty = true
          : _loginIsEmpty = false;
      _passwordController.text.isEmpty
          ? _passwordIsEmpty = true
          : _passwordIsEmpty = false;
    });
    print('sign in ${_loginController.text} ${_passwordController.text}');
  }

  void signInFacebook() {
    print('facebook');
  }

  void signInGoogle() {
    print('google');
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.fromLTRB(0, 50, 0, 60),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              onChanged: (String text) =>
                  setState(() => _loginIsEmpty = text.isEmpty),
              controller: _loginController,
              decoration: InputDecoration(
                hintText: 'example@gmail.com',
                labelText: 'Login',
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
                errorText: _passwordIsEmpty ? 'This is a required field' : null,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: forgotPassword,
                child: Text('Forgot password?'),
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: signIn,
              child: Text(
                'SIGN IN',
                style: Theme.of(context).textTheme.button,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                thickness: 2.0,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('- OR -'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: signInFacebook,
                  icon: Icon(FontAwesomeIcons.facebook),
                ),
                IconButton(
                  onPressed: signInGoogle,
                  icon: Icon(FontAwesomeIcons.google),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don`t have an account?'),
                TextButton(
                  onPressed: register,
                  child: Text(
                    'Register',
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
