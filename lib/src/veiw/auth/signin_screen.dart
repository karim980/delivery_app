import 'package:delivery_app/src/veiw/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/strings/app_string.dart';
import '../../controller/auth_controller.dart';
import '../widgets/defult_text_form_feild.dart';



class LoginView extends StatelessWidget {
  final AuthController _authController = Get.find();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
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
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      var sign= _authController.signIn(
                        _emailController.text,
                        _passwordController.text,
                      );
                      Get.offAll(HomeScreen());
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.signInButton,style: Theme.of(context).textTheme.headline2),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {

                  },
                  child: Text('Forgot Password'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
