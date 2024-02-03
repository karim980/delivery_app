import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 1.obs;

  void increment() {
    count.value++;
  }
  void decrement() {
    if(count.value!=1)
    count.value--;
  }
}
