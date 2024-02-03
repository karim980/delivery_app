import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/counter_controller.dart';

class CounterPage extends StatelessWidget {
  final CounterController _controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                _controller.decrement();
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.redAccent,
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 7),
                    child: Icon(Icons.remove,color: Colors.redAccent,),
                  ))),
          Obx(() => Container(color: Colors.redAccent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
                  child: Text(
                    '${_controller.count.value}',
                    style: TextStyle(fontSize: 26,color: Colors.white),
                  ),
                ),
              )),
          TextButton(
              onPressed: () {
                _controller.increment();
              },
              child:  Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.circular(13)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 7),
                    child: Icon(Icons.add,color: Colors.green,),
                  ))),
        ],
      ),
    );
  }
}
