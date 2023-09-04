import 'package:flutter/material.dart';

class MyButtonForm extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyButtonForm({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.blue.shade900,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
