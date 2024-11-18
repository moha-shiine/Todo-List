import 'package:flutter/material.dart';

class ElevatedBotom extends StatelessWidget {
  final String title;
  final VoidCallback OnTap;
  final Color color;
  const ElevatedBotom(
      {super.key,
      required this.title,
      required this.OnTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: OnTap,
            child: Text(title)),
      ),
    );
  }
}
