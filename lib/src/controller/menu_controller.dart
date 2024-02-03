import 'dart:convert';
import 'package:delivery_app/src/model/menu_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class MenuHelper {
  static Future<List<MenuModel>?> getData({required String path}) async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('$path').get();
    if (snapshot.exists) {
      var jsonString = json.encode(snapshot.value);
      return menuFromJson(jsonString);
    } else {
      print('No data available.');
    }
    return null;
  }

  static sendData({
    required String name,
    required var price,
    required String number,
  }) async {
    final DatabaseReference ref = FirebaseDatabase.instance.reference();
    await ref.child('orders').push().set({
      'name': name,
      'price': price,
      'number': number,
    });
    return null;
  }
}

class MenuPizzaController extends GetxController {
  var menu = <MenuModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchMenu();
    super.onInit();
  }

  void fetchMenu() async {
    isLoading(true);
    try {
      var menuList = await MenuHelper.getData(path: 'data');
      if (menuList != null) {
        menu.assignAll(menuList);
      }
    } finally {
      isLoading(false);
    }
  }
}
