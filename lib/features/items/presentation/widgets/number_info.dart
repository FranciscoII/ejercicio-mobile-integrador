import 'package:flutter/material.dart';

class NumberInfo extends StatelessWidget {
  final IconData iconData;
  final int number;
  final Color color;
  const NumberInfo({
    super.key, required this.iconData, required this.number, this.color = Colors.black
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, color: color,),
        Text(number.toString(), style: TextStyle(color: color),),
      ],
    );
  }
}
