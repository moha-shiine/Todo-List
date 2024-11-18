import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:login/widget/RdioList.dart';
import 'package:login/widget/datawidget.dart';

import 'elevation.dart';

class CardBottomsheet extends StatefulWidget {
  const CardBottomsheet({
    super.key,
  });

  @override
  State<CardBottomsheet> createState() => _CardBottomsheetState();
}

class _CardBottomsheetState extends State<CardBottomsheet> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue;
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
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
            const Gap(
              10,
            ),
            const Center(
              child: Text(
                "Add New Todo Task",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
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
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RadioBotomList(
                    TitelCategory: 'LRN',
                    colorCategory: Colors.green,
                  ),
                ),
                Expanded(
                  child: RadioBotomList(
                    TitelCategory: 'GEN',
                    colorCategory: Colors.blue,
                  ),
                ),
                Expanded(
                  child: RadioBotomList(
                    TitelCategory: 'WRK',
                    colorCategory: Colors.amber,
                  ),
                ),
              ],
            ),
            Gap(10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                datawidget(
                  title: 'Data',
                  datevalue: 'dd/mm/yy',
                  Icons: IconlyLight.calendar,
                ),
                Gap(23),
                datawidget(
                  title: 'Time',
                  datevalue: 'hh/mm/ss',
                  Icons: Icons.lock_clock,
                ),
              ],
            ),
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedBotom(
                  OnTap: () {},
                  title: "Cancel",
                  color: Colors.red,
                ),
                Gap(23),
                ElevatedBotom(
                  OnTap: () {},
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
