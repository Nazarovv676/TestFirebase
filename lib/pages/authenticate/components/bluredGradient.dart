import 'dart:ui';

import 'package:flutter/material.dart';

class BluredGradient extends StatelessWidget {
  const BluredGradient({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(245, 210, 0, 1),
            Color.fromRGBO(252, 166, 13, 1),
            Color.fromRGBO(230, 80, 0, 1),
            Color.fromRGBO(252, 21, 13, 1),
            Color.fromRGBO(250, 28, 113, 1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black.withOpacity(0.1),
          child: child,
        ),
      ),
    );
  }
}
