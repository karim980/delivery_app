import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/strings/app_string.dart';
import '../controller/auth_controller.dart';
import '../controller/user_controller.dart';
import '../model/user_model.dart';

class UserInformation extends StatelessWidget {
  final UserController _controller = UserController();
  final AuthController _authController = AuthController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel?>(
        future: _controller.getUserInformation(_authController.userId!),
        builder: (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
          if (snapshot.hasError) {
            Get.defaultDialog(
                title:'Something went wrong',
                cancel: ElevatedButton(onPressed: (){
                  Get.back();
                }, child: Text('cancel'))
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }

          if (!snapshot.hasData || snapshot.data == null) {
            Get.defaultDialog(
                title:'User not found',
                cancel: ElevatedButton(onPressed: (){
                  Get.back();
                }, child: Text('cancel'))
            );
          }

          UserModel user = snapshot.data!;
          var _appTheme = Theme.of(context).textTheme;


          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                    child: Text(AppStrings.myProfile, style: _appTheme.subtitle1),
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  fit: StackFit.loose,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage:  NetworkImage('https://cdn-icons-png.flaticon.com/512/3177/3177440.png'),
                      radius: 75,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context).scaffoldBackgroundColor),
                              borderRadius: BorderRadius.circular(80))),
                    ),
                  ],
                ),
                Text(user.name),
                Text(user.address),
                ElevatedButton(onPressed: (){}, child: Text('Edit profile'))
              ],
            ),
          );
        },
      ),
    );
  }
}