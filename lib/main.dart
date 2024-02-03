import 'package:delivery_app/core/app_theme.dart';
import 'package:delivery_app/src/controller/auth_controller.dart';
import 'package:delivery_app/src/controller/counter_controller.dart';
import 'package:delivery_app/src/controller/menu_controller.dart';
import 'package:delivery_app/src/veiw/auth/onboarding_screen.dart';
import 'package:delivery_app/src/veiw/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put<AuthController>(AuthController());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController _authController = AuthController();
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme,
      initialBinding: BindingsBuilder(() {
       Get.put<MenuPizzaController>(MenuPizzaController());
       Get.put<CounterController>(CounterController());
      }),
      home: GetX<AuthController>(
        init: _authController,
        builder: (_) {
          return _.user.value == null ? OnBoardingScreen() : HomeScreen();
        },
      ),
    );
  }
}
