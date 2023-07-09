import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/auth/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: AuthScreen(),
      theme: theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
