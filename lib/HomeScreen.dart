import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controlButtons.dart';
import 'controller.dart';
import 'display.dart';
import 'lap_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StopwatchController _controller = StopwatchController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2757),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'StopWatch',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ValueListenableBuilder<StopwatchState>(
                valueListenable: _controller,
                builder: (context, state, child) {
                  return StopwatchDisplay(
                    hours: state.hours,
                    minutes: state.minutes,
                    seconds: state.seconds,
                  );
                },
              ),
              const SizedBox(height: 50),
              ValueListenableBuilder<StopwatchState>(
                valueListenable: _controller,
                builder: (context, state, child) {
                  return LapList(laps: state.laps);
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _controller.addLap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Add Lap',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder<StopwatchState>(
                valueListenable: _controller,
                builder: (context, state, child) {
                  return ControlButtons(
                    started: state.started,
                    onStartStop: _controller.startStop,
                    onReset: _controller.reset,
                  );
                },
              ),
             SizedBox(height: 30.h,),
            ],
          ),
        ),
      ),
    );
  }
}
