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
                    return CardBottomsheet();
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
              padding: EdgeInsets.symmetric(horizontal: 150),
              child: Divider(
                thickness: 3,
                height: 2,
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
            const Gap(
              10,
            ),
            Center(
              child: const Text(
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
            Gap(10),
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
            Gap(10),
            const Text(
              "Category",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const Gap(
              10,
            ),
            Material(
              child: RadioListTile(
                title: Text("LRN"),
                value: "LRN",
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                groupValue: selectedValue,
              ),
            )
          ],
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