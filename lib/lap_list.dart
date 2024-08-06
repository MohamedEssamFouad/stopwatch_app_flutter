import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LapList extends StatelessWidget {
  final List<String> laps;

  const LapList({
    required this.laps,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFF323F68),
        ),
        child: ListView.builder(
          itemCount: laps.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Lap ${index + 1} - ${laps[index]}',
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            );
          },
        ),
      ),
    );
  }
}
