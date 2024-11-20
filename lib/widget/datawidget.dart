import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class datawidget extends StatelessWidget {
  final String? title;
  final RxString? datevalue;
  final IconData? Icons;
  final VoidCallback onTap;
  const datawidget({
    super.key,
    required this.title,
    required this.datevalue,
    required this.Icons,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Text(
                title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Gap(5),
            Container(
              // width: 130,
              // height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8)),

              // ignore: sort_child_properties_last
              child: Row(
                children: [
                  Icon(Icons),
                  Gap(10),
                  Obx(() => Text(
                        datevalue!.value,
                        style: TextStyle(fontSize: 15),
                      ))
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            )
          ],
        ),
      ),
    );
  }
}
