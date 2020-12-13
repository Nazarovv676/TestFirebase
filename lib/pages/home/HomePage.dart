import 'package:flutter/material.dart';
import 'package:testfirebase/services/authService.dart';

class HomePage extends StatefulWidget {
  String get route => '/home';

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  void _logOut() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home page'),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              onPressed: _logOut,
            )
          ],
        ),
      ),
    );
  }
}
