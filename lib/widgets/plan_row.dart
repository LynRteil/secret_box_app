import 'package:flutter/material.dart';

class PlanRow extends StatelessWidget {
  const PlanRow({super.key,required this.text });
final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check, color: Colors.white,size: 15,),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'Gilroy',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
