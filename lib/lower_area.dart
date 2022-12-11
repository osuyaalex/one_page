
import 'package:charles/codesep/animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller/state_controller.dart';

class LowerArea extends StatefulWidget {
  final AnimationController controller;
  final Animation<Offset> anime;





   LowerArea({Key? key, required this.controller, required this.anime,}) : super(key: key);

  @override
  State<LowerArea> createState() => _LowerAreaState();
}

class _LowerAreaState extends State<LowerArea> {
  bool _bigger = true;
  bool _fade = true;

  void move(){

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Animate(
            context.watch<StateController>().req == true?Row(
               key: Key('1'),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: const Text('Tall Frappuccino',
                    style: TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.h),
                  child: const Text('Swipe Down',
                    style: TextStyle(
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.h),
                  child: const Text('Pickup',
                    style: TextStyle(
                        fontWeight: FontWeight.w500
                    ),
                  ),
                )
              ],
            ):Container(key: Key('2'),),
          ),
        ),
        SlideTransition(
          position: widget.anime,

          child: AnimatedContainer(
            // height: 11.h,
            width: _bigger ? 35.h: 80.h,
            duration: const Duration(milliseconds: 500),
            child: Stack(
              fit: StackFit.loose,
              children: [
                Center(child: Image.asset('assets/images/baggie.png')),
                Center(
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: 4.h),
                    child: GestureDetector(
                      onHorizontalDragDown: (value){
                           widget.controller.forward();
                           setState(() {
                             _bigger = !_bigger;
                             _fade = !_fade;
                             context.read<StateController>().setReqValue();

                             print('this is fade $_fade ');

                           });
                      },
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (Widget child, Animation<double> animation){
                          return FadeTransition(opacity: animation, child: child,);
                        },
                        child: _fade? Container(
                          key: Key('1'),
                          height: 8.h,
                          width: 7.w,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Column(
                            children:  [
                              Padding(
                                padding: EdgeInsets.all(0.3.h),
                                child: Icon(
                                  Icons.lock_outline,
                                  color: Colors.white54,
                                  size: 2.5.h,

                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white12,
                                size: 3.h,
                              ),



                            ],
                          ),
                        ):null,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );

  }

}
