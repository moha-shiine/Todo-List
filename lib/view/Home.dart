import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';

import 'package:login/widget/headerWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChecked = false;
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
      backgroundColor: Colors.grey.shade300,
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
              cardwidget(),
              Gap(20),
              Container(
                height: 130,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      height: 128,
                      width: 20,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                              title: Text(
                                "Learn Flutter State Managment",
                                style: TextStyle(
                                    decoration: isChecked
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(
                                "learning widget  tree flutter",
                                style: TextStyle(
                                  decoration: isChecked
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                              trailing: Transform.scale(
                                scale: 1.9,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.green,
                                  shape: CircleBorder(),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value ?? false;
                                    });
                                  },
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Today  18/11/2024  12:30 PM",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              )
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
