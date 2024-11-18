import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:login/widget/Bottomesheet.dart';
import 'package:login/widget/datacard.dart';
import 'package:login/widget/datawidget.dart';
import 'package:login/widget/elevation.dart';
import 'package:login/widget/headerWidget.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        //  foregroundColor: Colors.red,
        backgroundColor: Colors.white,
        elevation: 4,
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
              Gap(10),
              Container(
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      height: 148,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                    )
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