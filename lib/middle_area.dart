
import 'package:charles/codesep/animated.dart';
import 'package:charles/codesep/sizenfave.dart';
import 'package:charles/codesep/topicon.dart';
import 'package:charles/controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MiddleArea extends StatefulWidget {
   MiddleArea({Key? key, required this.controller, required this.animation, }) : super(key: key);
 late AnimationController controller;
  Animation<Offset> animation;



  @override
  State<MiddleArea> createState() => _MiddleAreaState();
}

class _MiddleAreaState extends State<MiddleArea> {
  bool _flag = true;
  bool _favourite = true;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 52.h,
      child: Stack(
        children: [
          Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 135.0),
                  child: Text('STARBUCKS',
                    style: TextStyle(
                        fontFamily: 'Typette',
                        color: Colors.brown.shade200,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Animate(
                  context.watch<StateController>().req == true?Text('STARBUCKS',
                  key: Key('1'),
                  style: TextStyle(
                      fontFamily: 'Typette',
                      color: Colors.brown.shade100,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w400
                  ),
                ):Column(
                    children: [
                      Text('Your Order Will Be Available Shortly',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Icon(
                        Icons.check_circle,
                        size:40,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
                Animate(
                  context.watch<StateController>().req == true?Text('STARBUCKS',
                  key: Key('1'),
                  style: TextStyle(
                      fontFamily: 'Typette',
                      color: Colors.brown.shade50,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w400
                  ),
                ):Container(key: Key('2'),),
                ),
              ],
            ),

          Animate(
            context.watch<StateController>().req == true?Column(
               key: Key('1'),
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizeAndFave('Preference', ),
                      SizeAndFave( 'Fave!')
                    ],
                  ),
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                           _flag = !_flag;
                        });
                      },
                        child:Padding(
                          padding: const EdgeInsets.all(14.0),
                          key: const Key('1'),
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.brown.shade300,
                                      width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.coffee_outlined,
                                  size: 20,
                                ),
                              )
                          ),
                        )
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _favourite = !_favourite;
                        });
                      },
                        child: _favourite? TopIcon(icons: Icons.favorite_border, color: Colors.brown.shade300)
                        :TopIcon(
                            icons: Icons.favorite, color: Colors.brown.shade300)
                    )
                  ],
                )
              ],
            ):Container(key: Key('2'),),
          ),
              AnimatedSwitcher(
                duration: Duration(seconds: 1),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition( opacity: animation,
                  child: child);
                },
                  child: _flag == true ? Center(
                    key: const Key('1'),
                    child: SlideTransition(
                      position: widget.animation,
                      child: SizedBox(
                        height: 80.h,
                        width: 80.w,
                         child: Image.asset('assets/images/starcup.png'),
                       ),
                    ),
                  ):Center(
                    key: const Key('2'),
                    child: SlideTransition(
                      position: widget.animation,
                      child: SizedBox(
                        height: 80.h,
                        width: 80.w,
                        child: Image.asset('assets/images/greeen.png'),
                      ),
                    ),
                  ),
                   ),
          Positioned(
              child:
          Animate(
            context.watch<StateController>().req == true?Align(
               key: Key('1'),
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:  EdgeInsets.only(top: 30.h),
                child: Animate(
                   TopIcon(
                      icons: Icons.car_crash_outlined, color: Colors.brown.shade300),
                ),
              ),
            ):Container(key: Key('2'),),
          )),

           Positioned(
              child:Animate(
                context.watch<StateController>().req == true?Align(
                key: Key('1'),
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 330.0, left: 14),
                  child: Text('\$ 5.99',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              ):Container(key: Key('2'),),
              ),
           )
        ],
      ),
    );

  }
}

