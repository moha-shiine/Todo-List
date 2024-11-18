import 'dart:ui';

import 'package:flutter/material.dart';

class RadioBotomList extends StatefulWidget {
  const RadioBotomList(
      {super.key, required this.TitelCategory, required this.colorCategory});
  final String TitelCategory;
  final Color colorCategory;
  @override
  State<RadioBotomList> createState() => _RadioBotomListState();
}

class _RadioBotomListState extends State<RadioBotomList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: RadioListTile(
        enableFeedback: true,
        title: Text(
          widget.TitelCategory,
          style: TextStyle(color: widget.colorCategory),
        ),
        selected: true,
        value: "0",
        activeColor: widget.colorCategory,
        onChanged: (String? value) {
          setState(() {
            // value = 0
          });
        },
        groupValue: '0',
      ),
    );
  }
}
