// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:login/controller/datapicker.dart';
import 'package:login/service/taskcoloection.dart';
import 'package:login/widget/RadioList.dart';
import 'package:login/widget/datawidget.dart';

import '../controller/RadioController.dart';
import '../model/model_task.dart';
import '../widget/elevation.dart';

class CardBottomsheet extends StatefulWidget {
  const CardBottomsheet({
    super.key,
  });

  @override
  State<CardBottomsheet> createState() => _CardBottomsheetState();
}

class _CardBottomsheetState extends State<CardBottomsheet> {
  final TodoTaskController taskController = Get.put(TodoTaskController());

  @override
  void initState() {
    super.initState();
    taskController.fetchTasks();
  }

  final TimeController timeController = Get.put(TimeController());
  final DateController dateController = Get.put(DateController());
  final RadioController radioController = Get.put(RadioController());
  TextEditingController TitleTaskController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //String? selectedValue;
    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: Divider(
                thickness: 3,
                height: 2,
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
            const Gap(
              10,
            ),
            const Center(
              child: Text(
                "Add New Todo Task",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Gap(10),
            // ignore: deprecated_member_use
            Divider(thickness: 1, color: Colors.grey.withOpacity(0.5)),
            const Gap(10),
            const Text(
              "Title Task",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const Gap(
              10,
            ),
            TextField(
              controller: TitleTaskController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  hintText: "Add Task Name"),
            ),
            const Gap(10),
            const Text(
              "Discription",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const Gap(
              10,
            ),
            TextField(
              controller: discriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  hintText: "Add Description"),
            ),
            const Gap(10),
            const Text(
              "Category",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const Gap(
              10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RadioBotomList(
                    onChangeValue: () => radioController.updateGroupValue(1),
                    RadioValue: 1,
                    TitelCategory: 'LRN',
                    colorCategory: Colors.green,
                  ),
                ),
                Gap(20),
                Expanded(
                  child: RadioBotomList(
                    onChangeValue: () => radioController.updateGroupValue(2),
                    RadioValue: 2,
                    TitelCategory: 'WRK',
                    colorCategory: Colors.blue,
                  ),
                ),
                Gap(20),
                Expanded(
                  child: RadioBotomList(
                    onChangeValue: () => radioController.updateGroupValue(3),
                    RadioValue: 3,
                    TitelCategory: 'GEN',
                    colorCategory: Colors.amber.shade700,
                  ),
                ),
              ],
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                datawidget(
                    title: 'Data',
                    datevalue: dateController.dateValue,
                    Icons: IconlyLight.calendar,
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        dateController.updateDate(pickedDate);
                      }
                    }),
                Gap(23),
                datawidget(
                  onTap: () async {
                    // Show the time picker
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (pickedTime != null) {
                      timeController.updateTime(pickedTime);
                    }
                  },
                  Icons: Icons.lock_clock,
                  title: 'Time',
                  datevalue: timeController.timeValue,
                ),
              ],
            ),
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedBotom(
                  OnTap: () {
                    Navigator.pop(context);
                  },
                  title: "Cancel",
                  color: Colors.red,
                ),
                Gap(23),
                ElevatedBotom(
                  OnTap: () {
                    final getRadioValue = radioController.groupValue.value;
                    String Category = "";
                    switch (getRadioValue) {
                      case 1:
                        Category = 'learning';
                        break;
                      case 2:
                        Category = 'Working';
                        break;
                      case 3:
                        Category = 'General';
                        break;
                    }
                    taskController.addTask(TodoTask(
                      docId: '', // Firestore will generate this
                      titleTask: TitleTaskController.text,
                      description: discriptionController.text,
                      categoryTask: Category,
                      dateTask: dateController.dateValue.value,
                      timeTask: timeController.timeValue.value,
                      isChecked: false,
                    ));
                    TitleTaskController.clear();
                    radioController.updateGroupValue(0);

                    Navigator.pop(context);
                    //   print(object)
                  },
                  color: Colors.blue,
                  title: "Create",
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
