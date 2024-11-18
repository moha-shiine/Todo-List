import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';

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
              Gap(10),
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
                  Text(
                    "Shiine",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Spacer(),
              Icon(IconlyLight.calendar),
              Gap(10),
              Icon(IconlyLight.notification),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              cardwidget()
            ],
          ),
        ),
      ),
    );
  }
}

class cardwidget extends StatelessWidget {
  const cardwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const Text(
              "Tody's Task",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
            Gap(2),
            Text(
              "Monday 18 Nov",
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.70,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          Gap(10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 150),
                            child: Divider(
                              thickness: 3,
                              height: 2,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  context: context);
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: const Color.fromARGB(255, 249, 217, 221)),
            child: const Text(
              "+ Add New",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
            ))
      ],
    );
  }
}
// Center(
//         child: Text(
//           "Welcome TO ",
//           style: TextStyle(
//             decoration: TextDecoration.lineThrough,
//           // ),