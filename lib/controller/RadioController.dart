import 'package:get/get.dart';

class RadioController extends GetxController {
  // Observable variable for groupValue with default value 0
  var groupValue = 0.obs;

  // Method to update the groupValue
  void updateGroupValue(int value) {
    groupValue.value = value;
  }
}
