import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting dates
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:login/common/Bottomesheet.dart';
import 'package:login/service/taskcoloection.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoTaskController taskController = Get.find<TodoTaskController>();

    // Get today's date in the format 'yyyy-MM-dd'
    final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Obx(() {
      // Count tasks for today by filtering the list
      final int tasksTodayCount = taskController.todoTasks.where((task) {
        // Parse dateTask if necessary
        final taskDate = DateFormat('yyyy-MM-dd').parse(task.dateTask);
        return DateFormat('yyyy-MM-dd').format(taskDate) == today;
      }).length;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Today's Task",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Gap(2),
              Text(
                DateFormat('EEEE, d MMM')
                    .format(DateTime.now()), // Example: Monday, 18 Nov
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Gap(5),
              Text(
                "$tasksTodayCount Task${tasksTodayCount == 1 ? '' : 's'} Today",
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                builder: (context) {
                  return const CardBottomsheet();
                },
                context: context,
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: const Color.fromARGB(255, 249, 217, 221),
            ),
            child: const Text(
              "+ Add New",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
              ),
            ),
          )
        ],
      );
    });
  }
}
