import 'package:delivery_app/core/colors/app_color.dart';
import 'package:delivery_app/src/veiw/auth/sign_up_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingAtr {
  final String ? image;
  final String title;
  final String body;

  OnBoardingAtr({
    this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatelessWidget {
  final List<OnBoardingAtr> boarding = [
    OnBoardingAtr(
      image: 'assets/pngegg.png',
      title: 'Delicious Food',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    OnBoardingAtr(
      image: 'assets/pngegg.png',
      title: 'Delicious Food',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    OnBoardingAtr(
      image: 'assets/pngegg.png',
      title: 'Delicious Food',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    OnBoardingAtr(
      image: 'assets/pngegg.png',
      title: '',
      body: '',
    ),
  ];

  final PageController boardController = PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: boardController,
              itemBuilder: (context, index) => buildBoarding(boarding[index]),
              itemCount: boarding.length,
              physics: BouncingScrollPhysics(),
              onPageChanged: (int index) {
                if(3 == index){
                  Get.to(() => SignInUp());
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,bottom: 30),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.white,
                    activeDotColor: Colors.white,
                  ),
                  count: boarding.length,
                ),
                Spacer(),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          )
        ],
      ),
    );
  }

  Widget buildBoarding(OnBoardingAtr model,) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('${model.image}')),
          SizedBox(
              height: 30
          ),
          Text(
            '${model.title}',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
              height: 25
          ),
          Text(
            '${model.body}',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
