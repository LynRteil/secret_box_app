import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCircularIndicator extends StatelessWidget {
  final double percent;
  final String usedText;
  final String label;
  final double width;
  final double height;

  const CustomCircularIndicator({
    super.key,
    required this.percent,
    required this.usedText,
    required this.label,
    this.width = 206,
    this.height = 206,
  });

  @override
  Widget build(BuildContext context) {
    final double radius = (width < height ? width : height) / 2;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularPercentIndicator(
            radius: radius,
            lineWidth: 22.0,
            percent: 1.0,
            progressColor: const Color(0xFF777777).withOpacity(0.4),
            backgroundColor: Colors.transparent,
            circularStrokeCap: CircularStrokeCap.round,
            startAngle: 360,
          ),

          CircularPercentIndicator(
            radius: radius - 3,
            lineWidth: 17.0,
            percent: percent,
            progressColor: const Color(0xFF3859C5).withOpacity(0.5),
            backgroundColor: Colors.transparent,
            circularStrokeCap: CircularStrokeCap.round,
            startAngle: 360,
            reverse: true,
            animation: true,
            animationDuration: 1000,
            
          ),

          CircularPercentIndicator(
            radius: radius - 5,
            lineWidth: 15.0,
            percent: percent,
            progressColor: const Color(0xFF3859C5),
            backgroundColor: Colors.transparent,
            circularStrokeCap: CircularStrokeCap.round,
            startAngle: 360,
            reverse: true,
            animation: true,
            animationDuration: 1000,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  usedText,
                  style: const TextStyle(
                    fontFamily: "Gilroy",
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3859C5),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(221, 99, 97, 97),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
