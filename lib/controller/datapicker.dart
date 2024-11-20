import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateController extends GetxController {
  var dateValue = "yyyy-mm-dd".obs;

  // Method to update the date
  void updateDate(DateTime date) {
    dateValue.value =
        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}

class TimeController extends GetxController {
  // Observable variable for time value
  var timeValue = "hh:mm PM".obs;

  // Method to update the time
  void updateTime(TimeOfDay time) {
    timeValue.value =
        "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }
}
