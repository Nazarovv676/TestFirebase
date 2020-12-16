import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:testfirebase/pages/authenticate/components/bluredGradient.dart';
import 'package:testfirebase/pages/authenticate/signUpPage.dart';
import 'package:testfirebase/pages/home/HomePage.dart';
import 'package:testfirebase/pages/authenticate/signInPage.dart';
import 'package:testfirebase/pages/wrapper.dart';
import 'package:testfirebase/services/authService.dart';

final bool signedIn = false;

void main() {
  runApp(InitializeApp());
}

class InitializeApp extends StatefulWidget {
  @override
  _InitializeAppState createState() => _InitializeAppState();
}

class _InitializeAppState extends State<InitializeApp> {
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      print(e);
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return ErrorInitializePage();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return LoadingScreen();
    }

    return StartScreen();
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Comfortaa',
          backgroundColor: Colors.grey[900],
        ),
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Comfortaa',
          backgroundColor: Colors.white,
        ),
        themeMode: kIsWeb ? ThemeMode.light : ThemeMode.system,
        home: Wrapper(),
        routes: {
          HomePage().route: (context) => HomePage(),
          SignInPage().route: (context) => SignInPage(),
          SignUpPage().route: (context) => SignUpPage(),
        },
      ),
    );
  }
}

class ErrorInitializePage extends StatelessWidget {
  const ErrorInitializePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: BluredGradient(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  size: 50,
                ),
                Text('Something error when initialise firebase services'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: BluredGradient(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
