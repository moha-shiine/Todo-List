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
            const Gap(2),
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
                    return const CardBottomsheet();
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

class datawidget extends StatelessWidget {
  final String? title;
  final String? datevalue;
  final IconData? Icons;
  const datawidget({
    super.key,
    required this.title,
    required this.datevalue,
    required this.Icons,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                Text(
                  datevalue!,
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          )
        ],
      ),
    );
  }
}

class RadioBotomList extends StatefulWidget {
  const RadioBotomList(
      {super.key, required this.TitelCategory, required this.colorCategory});
  final String TitelCategory;
  final Color colorCategory;
  @override
  State<RadioBotomList> createState() => _RadioBotomListState();
}

class _RadioBotomListState extends State<RadioBotomList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: RadioListTile(
        enableFeedback: true,
        title: Text(
          widget.TitelCategory,
          style: TextStyle(color: widget.colorCategory),
        ),
        selected: true,
        value: "0",
        activeColor: widget.colorCategory,
        onChanged: (String? value) {
          setState(() {
            // value = 0
          });
        },
        groupValue: '0',
      ),
    );
  }
}

class ElevatedBotom extends StatelessWidget {
  final String title;
  final VoidCallback OnTap;
  final Color color;
  const ElevatedBotom(
      {super.key,
      required this.title,
      required this.OnTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: OnTap,
            child: Text(title)),
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