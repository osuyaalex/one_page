import 'package:charles/controller/state_controller.dart';
import 'package:charles/main_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_){
              return StateController();
            })
          ],
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   return ResponsiveSizer(
       builder: (context, orientation, deviceType){
         SystemChrome.setSystemUIOverlayStyle(
             const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
         );
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           title: 'Flutter Demo',
           theme: ThemeData(
             primarySwatch: Colors.blue,
           ),

           home:const MainHome() ,
         );
       }
   );
  }
}

