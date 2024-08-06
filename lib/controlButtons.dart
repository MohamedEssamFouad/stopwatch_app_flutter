import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ControlButtons extends StatelessWidget {
  final bool started;
  final VoidCallback onStartStop;
  final VoidCallback onReset;

  const ControlButtons({
    required this.started,
    required this.onStartStop,
    required this.onReset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onStartStop,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueAccent,
              ),
              child: Text(
                textAlign: TextAlign.center,
                started ? 'Stop' : 'Start',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 25),
        Expanded(
          child: GestureDetector(
            onTap: onReset,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueAccent,
              ),
              child: Text(
                textAlign: TextAlign.center,
                'Reset',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
