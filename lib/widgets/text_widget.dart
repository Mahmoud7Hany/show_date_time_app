import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue, // لون الخلفية
        borderRadius: BorderRadius.circular(10.0), // شكل الزوايا
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20.0), // هامش داخلي
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 27,
          color: Colors.white,
        ),
      ),
    );
  }
}
