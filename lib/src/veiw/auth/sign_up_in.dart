import 'package:delivery_app/core/colors/app_color.dart';
import 'package:delivery_app/src/veiw/auth/signin_screen.dart';
import 'package:delivery_app/src/veiw/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInUp extends StatelessWidget {
  const SignInUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/pngegg.png')),
            MaterialButton(
              color: AppColors.mainColor,
              onPressed: () {
                Get.to( () => LoginView());
              },
              child: Text('Sign In'),
            ),
            MaterialButton(
              onPressed: () {
                Get.to( () => SignUpView());
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
