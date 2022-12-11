import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EndResult extends StatelessWidget {
  const EndResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top:40.h ),
              child: Text('STARBUCKS',
                style: TextStyle(
                    fontFamily: 'Typette',
                    color: Colors.brown.shade200,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
            Container(
              height: 8.h,
              width: 8.h,
              decoration: const BoxDecoration(
                color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: const Icon(
                Icons.read_more_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Thanks for your purchase',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 18.sp
                ),
              ),
            )
          ],
        ),
    );

  }
}
