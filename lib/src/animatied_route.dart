import 'package:flutter/cupertino.dart';

class SlideRight extends PageRouteBuilder {
  final page;

  SlideRight({this.page})
      : super(
            pageBuilder: (context, animation, animationTwo) => page,
            transitionsBuilder: (context, animation, animationTwo, child) {
              var begin = Offset(1.0, 0.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin , end: end);
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(position: offsetAnimation,child: child,);
            });
}
