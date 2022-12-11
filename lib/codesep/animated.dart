import 'package:flutter/material.dart';

class Animate extends StatelessWidget {
  Widget widget;
   Animate(this.widget,{Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: Duration(seconds: 2),
      transitionBuilder: (Widget child, Animation<double> animation){
        return FadeTransition(opacity: animation, child: child,);
      },
      child: widget,
    );
  }
}
