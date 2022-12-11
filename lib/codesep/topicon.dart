import 'package:flutter/material.dart';

class TopIcon extends StatelessWidget {
  final IconData icons;
  final Color color;
  const TopIcon({Key? key, required this.icons, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(
                color: color,
                width: 3
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
              child: Icon(
                icons,
                size: 20,
              ),
            )

      ),
    );
  }
}
