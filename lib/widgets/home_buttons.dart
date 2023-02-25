// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zoom_clone/utilities/colors.dart';

class HomePageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomePageButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 35.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
