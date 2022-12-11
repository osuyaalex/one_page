import 'package:charles/codesep/topicon.dart';
import 'package:charles/lower_area.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import 'middle_area.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
   late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<Offset> _anime;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2)
    );
    _animation = Tween<Offset>(
      begin:Offset (0.0, 0.0),
      end: Offset (0.0,3.0),
    ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn));

    _anime = Tween<Offset>(
      begin:Offset (0.0, 0.0),
      end: Offset (0.0,-0.3),
    ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn));

    super.initState();

  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
         physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.only(top: 3.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   GestureDetector(
                     onTap: (){
                       Navigator.pop(context);
                     },
                       child: TopIcon(icons: Icons.arrow_back, color:Colors.grey.shade300 ,)),
                  SizedBox(
                    height: 13.h,
                      width: 13.w,
                      child: Image.asset('assets/images/download.png')
                  ),
                  TopIcon(icons: Icons.shopping_bag_outlined, color: Colors.grey.shade300,),
                ],
              ),
               SizedBox(
                height: 3.h,
              ),
               Text('Frappuccino',
                style: TextStyle(
                  fontSize: 27.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text('White Chocolate',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400
                  ),
              ),
               ),
              MiddleArea(
                     controller: _animationController,
                     animation: _animation,



              ),



               LowerArea(controller: _animationController, anime: _anime,),
            ],
          ),
        ),
      ),
    );
  }
}
