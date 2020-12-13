import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testfirebase/models/user.dart';
import 'package:testfirebase/pages/home/HomePage.dart';
import 'package:testfirebase/pages/signUpIn/alternativeSignIn.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    if (user == null) {
      return SignInPageAlternative();
    } else {
      return HomePage();
    }
  }
}
