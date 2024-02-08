import 'package:delivery_app/core/colors/app_color.dart';
import 'package:delivery_app/src/controller/menu_controller.dart';
import 'package:delivery_app/src/controller/user_controller.dart';
import 'package:delivery_app/src/veiw/widgets/counter_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/strings/app_string.dart';
import '../controller/auth_controller.dart';
import '../controller/counter_controller.dart';
import '../model/user_model.dart';

class InfoScreen extends StatelessWidget {
  final CounterController _controller = Get.put(CounterController());
  final UserController _userController = Get.put(UserController());
  final AuthController _authController = AuthController();
  String name;
  String image;
  List ingredients;
  var price;
  bool spicy;
  bool vegetarian;

  InfoScreen({
    required this.name,
    required this.image,
    required this.price,
    required this.spicy,
    required this.ingredients,
    required this.vegetarian,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: NetworkImage(image)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(name,
                          style: TextStyle(
                            fontSize: 24,
                          )),
                      Spacer(),
                      CounterPage(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: ingredients.length,
                    itemBuilder: (context, index) {
                      return Text(ingredients[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (spicy == true) Text('spicy'),
                      spicy == false ? Text('original') : SizedBox.shrink(),
                      if (vegetarian == true) Text('vegetarian'),
                      vegetarian == false
                          ? Text('is not vegetarian')
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
                Spacer(),
                Divider(thickness: 1.5),
                FutureBuilder<UserModel?>(
                  future: _userController.getUserInformation(_authController.userId!),
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


                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.name),
                          Text(user.address),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() =>
                                  Text('\$ ${_controller.count.toDouble() * price}')),
                              SizedBox(
                                width: 30,
                              ),

                              ElevatedButton(
                                  onPressed: () {
                                    MenuHelper.sendData(
                                        name: name,
                                        price: '\$ ${_controller.count.toDouble() * price}',
                                        number: _controller.count.toString(), address: user.address, userName: user.name, phone: user.phone);
                                    Get.back();
                                    Get.showSnackbar(GetSnackBar(title: 'Order Success',message: 'order in the way',backgroundColor: AppColors.mainColor,));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'send req',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        Icon(CupertinoIcons.cart)
                                      ],
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
