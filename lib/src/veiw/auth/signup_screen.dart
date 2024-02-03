import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/strings/app_string.dart';
import '../../controller/auth_controller.dart';
import '../widgets/defult_text_form_feild.dart';

class SignUpView extends StatelessWidget {
  final AuthController _authController = Get.find();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  type: TextInputType.emailAddress,
                  controller: _emailController,
                  hintText: AppStrings.email,
                ),
                CustomTextFormField(
                  controller: _passwordController,
                  hintText: AppStrings.password,
                  obscureText: true,
                ),
                CustomTextFormField(
                  controller: _passwordController,
                  hintText: AppStrings.confirmPassword,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    var signup = await _authController.signUp(
                        email: _emailController.text,
                        password: _passwordController.text);
                    debugPrint(signup);
                    Get.back();
                  },
                  child: Text(AppStrings.signUpButton),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('you already have an account? Sign in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
