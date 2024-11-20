import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
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
  final int RadioValue;
  final VoidCallback onChangeValue;
  @override
  State<RadioBotomList> createState() => _RadioBotomListState();
}

final RadioController radioController = Get.put(RadioController());

class _RadioBotomListState extends State<RadioBotomList> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RadioListTile<int>(
        contentPadding: EdgeInsetsDirectional.zero,
        enableFeedback: true,
        title: Transform.translate(
          offset: Offset(-22, 0),
          child: Text(
            widget.TitelCategory,
            style: TextStyle(
                color: widget.colorCategory, fontWeight: FontWeight.w800),
          ),
        ),
        selected: radioController.groupValue.value == widget.RadioValue,
        value: widget.RadioValue,
        activeColor: widget.colorCategory,
        onChanged: (value) {
          if (value != null) {
            radioController.updateGroupValue(value);
            widget.onChangeValue();
          }
        },
        groupValue: radioController.groupValue.value,
      ),
    );
  }
}
