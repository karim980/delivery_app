import 'package:delivery_app/core/colors/app_color.dart';
import 'package:delivery_app/src/animatied_route.dart';
import 'package:delivery_app/src/controller/menu_controller.dart';
import 'package:delivery_app/src/model/menu_model.dart';
import 'package:delivery_app/src/veiw/info_page.dart';
import 'package:delivery_app/src/veiw/user_info_screen.dart';
import 'package:delivery_app/src/veiw/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  final MenuPizzaController controller = Get.find();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: FoodSearchBar(
          onSearchTextChanged: (p0) {},
        ),
        actions: [
          IconButton(
              onPressed: () {
                authController.signOut();
              },
              icon: Icon(Icons.logout)),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  Get.to( () => UserInformation());
                },
                icon: Icon(Icons.account_circle)),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 35.0),
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.saleColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                  width: 200,
                                  image: AssetImage('assets/pngegg.png')),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'the first\norder',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text('bay 1\n take 2'),
                                  ),
                                ],
                              )
                            ]),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  // Set the number of columns in the grid
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                  childAspectRatio: 3.5 / 6),
                          itemCount: controller.menu.length,
                          itemBuilder: (context, index) {
                            MenuModel menu = controller.menu[index];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(SlideRight(
                                    page: InfoScreen(
                                  name: menu.name,
                                  price: menu.price,
                                  image: menu.image,
                                  spicy: menu.spicy,
                                  ingredients: menu.ingredients,
                                  vegetarian: menu.vegetarian,
                                )));
                              },
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(
                                        image: NetworkImage(menu.image),
                                        height: 150,
                                        width: double.infinity,
                                        fit: BoxFit.fill),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            menu.name,
                                            style: TextStyle(fontSize: 23),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(menu.ingredients[0]),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(menu.price.toString()),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
