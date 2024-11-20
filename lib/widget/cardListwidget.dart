import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/model_task.dart';

class TaskCard extends StatelessWidget {
  final TodoTask task;
  final ValueChanged<bool?> onChanged;

  const TaskCard({
    Key? key,
    required this.task,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color Categorycolor = Colors.white;
    final getcategory = task.categoryTask;
    switch (getcategory) {
      case 'learning':
        Categorycolor = Colors.green;
        break;
      case 'Working':
        Categorycolor = Colors.blue;
        break;
      case 'General':
        Categorycolor = Colors.amber.shade700;
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Categorycolor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      task.titleTask,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: task.isChecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text(
                      task.description,
                      style: TextStyle(
                        decoration: task.isChecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: Transform.scale(
                      scale: 1.4,
                      child: Checkbox(
                        value: task.isChecked,
                        onChanged: onChanged,
                        activeColor: Colors.green,
                        checkColor: Colors.white,
                        shape: const CircleBorder(),
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      task.dateTask,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
