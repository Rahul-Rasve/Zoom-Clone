// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_provider.dart';
import 'package:zoom_clone/screens/join_video_call_view.dart';
import 'package:zoom_clone/utilities/colors.dart';

import 'screens/home_page.dart';
import 'screens/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/loginView': (context) => LoginView(),
        '/home': (context) => HomePage(),
        '/videoCall': (context) => VideoCallView(),
      },
      home: StreamBuilder(
        stream: AuthProvider().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginView();
          }
        },
      ),
    );
  }
}
