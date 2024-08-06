import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StopwatchDisplay extends StatelessWidget {
  final String hours;
  final String minutes;
  final String seconds;

  const StopwatchDisplay({
    required this.hours,
    required this.minutes,
    required this.seconds,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$hours:$minutes:$seconds',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 70.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
