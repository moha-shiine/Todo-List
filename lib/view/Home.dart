import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:login/service/taskcoloection.dart';
import 'package:login/widget/cardListwidget.dart';

import 'package:login/widget/headerWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChecked = false;
  final TodoTaskController taskController = Get.put(TodoTaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        //  foregroundColor: Colors.red,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images.png",
                    height: 40,
                    width: 40,
                  )),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //  Gap(8),
                  Text(
                    "Hello",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade400),
                  ),
                  const Text(
                    "Shiine",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(IconlyLight.calendar),
              const Gap(10),
              const Icon(IconlyLight.notification),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CardWidget(),
              Gap(20),
              FutureBuilder(
                future: taskController.fetchTasks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Failed to load tasks: ${snapshot.error}',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    return Obx(() {
                      if (taskController.todoTasks.isEmpty) {
                        return const Center(
                          child: Text(
                            'No tasks available',
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      }
                      return ListView.builder(
                        //reverse: true,
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: taskController.todoTasks.length,
                        itemBuilder: (context, index) {
                          final task = taskController.todoTasks[index];
                          return TaskCard(
                            task: task,
                            onChanged: (value) {
                              taskController.updateTaskStatus(
                                  task.docId, value ?? false);
                            },
                          );
                        },
                      );
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Center(
//         child: Text(
//           "Welcome TO ",
//           style: TextStyle(
//             decoration: TextDecoration.lineThrough,
//           // ),
