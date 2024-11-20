import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:login/controller/RadioController.dart';

class RadioBotomList extends StatefulWidget {
  const RadioBotomList(
      {super.key,
      required this.TitelCategory,
      required this.colorCategory,
      required this.RadioValue,
      required this.onChangeValue});
  final String TitelCategory;
  final Color colorCategory;
  final int? RadioValue;
  final VoidCallback onChangeValue;
  @override
  State<RadioBotomList> createState() => _RadioBotomListState();
}

final RadioController radioController = Get.put(RadioController());

class _RadioBotomListState extends State<RadioBotomList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: RadioListTile(
        contentPadding: EdgeInsetsDirectional.zero,
        enableFeedback: true,
        title: Transform.translate(
          offset: Offset(-22, 0),
          child: Text(
            widget.TitelCategory,
            style: TextStyle(color: widget.colorCategory),
          ),
        ),
        // selected: true,
        value: widget.RadioValue,
        activeColor: widget.colorCategory,
        onChanged: (value) => widget.onChangeValue,
        groupValue: radioController.groupValue,
      ),
    );
  }
}
