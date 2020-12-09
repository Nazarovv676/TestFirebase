import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: Colors.green[800],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Welcome!',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: HexColor('#9F9F9F')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 30, 20),
                  child: Text('Sign In',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 45,
                          color: Colors.white)),
                ),
                ExpandedContainer()
              ],
            )),
      ),
    );
  }
}

class ExpandedContainer extends StatelessWidget {
  const ExpandedContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            TextFieldLabeled(
              label: 'Login',
              hint: 'example@gmail.com',
            ),
            SizedBox(height: 30),
            TextFieldLabeled(
              label: 'Password',
              hint: '•••••••',
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: ButtonTheme(
                minWidth: 200.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Login"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldLabeled extends StatelessWidget {
  final String label;
  final String hint;

  const TextFieldLabeled({Key key, this.label, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
          ),
          cursorColor: Colors.green[800],
        ),
      ],
    );
  }
}
