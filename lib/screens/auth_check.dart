import 'package:flutter/material.dart';

class AuthNavigator {
  final BuildContext context;
  final Widget authenticated;
  AuthNavigator(this.context, this.authenticated) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AuthCheck(authenticated: authenticated)));
  }
}

class AuthCheck extends StatelessWidget {
  const AuthCheck({Key? key, required this.authenticated}) : super(key: key);
  final Widget authenticated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: authenticated,
      ),
    );
  }
}
