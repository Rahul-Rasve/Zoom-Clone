// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_provider.dart';
import 'package:zoom_clone/widgets/round_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthProvider authProvider = AuthProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Start or join a meeting',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Image.asset('assets/images/zoomPicture.jpg'),
          ),
          RoundButton(
            text: 'Sign In',
            onPressed: () async {
              bool result = await authProvider.signInWithGoogle(context);
              if (result) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              }
            },
          ),
        ],
      ),
    );
  }
}
