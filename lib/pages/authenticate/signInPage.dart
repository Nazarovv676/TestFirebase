import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testfirebase/pages/authenticate/signUpPage.dart';
import 'package:testfirebase/services/authService.dart';

import 'components/bluredGradient.dart';

class SignInPage extends StatelessWidget {
  String get route => '/signIn';
  const SignInPage({Key key}) : super(key: key);

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

  bool _isLoading = false;

  final AuthService _auth = AuthService();

  void anonLogin() async {
    setState(() {
      _isLoading = true;
    });
    dynamic result = await _auth.signInAnon();
    if (result == null)
      print('error singing in');
    else {
      print('signed in');
      print(result.uid);
    }
  }

  void register() {
    print('register');
    Navigator.pushNamed(context, SignUpPage().route);
  }

  //TODO forgot password
  void forgotPassword() {
    print('forgot password');
  }

  //TODO sign in
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

  //TODO facebook
  void signInFacebook() {
    print('facebook');
  }

  //TODO google
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
              child: _isLoading
                  ? LinearProgressIndicator()
                  : Divider(
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
            BottomText(
              anonLogin: anonLogin,
              register: register,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomText extends StatelessWidget {
  const BottomText({Key key, this.register, this.anonLogin}) : super(key: key);

  final Function register;
  final Function anonLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              text: 'Don`t have an account? ',
              children: [
                TextSpan(
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(color: Theme.of(context).accentColor),
                  text: 'Register\n',
                  recognizer: TapGestureRecognizer()..onTap = register,
                ),
                TextSpan(text: 'or '),
                TextSpan(
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(color: Theme.of(context).accentColor),
                  text: 'Anonymous login',
                  recognizer: TapGestureRecognizer()..onTap = anonLogin,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
