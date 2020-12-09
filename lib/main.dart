import 'package:flutter/material.dart';
import 'package:testfirebase/pages/home/HomePage.dart';
import 'package:testfirebase/pages/signIn/signInPage.dart';
import 'package:testfirebase/pages/signUp/signUpPage.dart';

final bool signedIn = false;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData(),
      themeMode: ThemeMode.system,
      initialRoute: signedIn ? '/home' : '/signIn',
      routes: {
        '/home': (context) => HomePage(),
        '/signIn': (context) => SignInPage(),
        '/signUp': (context) => SignUpPage(),
      },
    );
  }
}
