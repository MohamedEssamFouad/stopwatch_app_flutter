import 'dart:async';
import 'package:flutter/foundation.dart';

class StopwatchState {
  final String hours;
  final String minutes;
  final String seconds;
  final bool started;
  final List<String> laps;

  StopwatchState({
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.started,
    required this.laps,
  });
}

class StopwatchController extends ValueNotifier<StopwatchState> {
  StopwatchController()
      : super(StopwatchState(
    hours: '00',
    minutes: '00',
    seconds: '00',
    started: false,
    laps: [],
  ));

  int _ssec = 0, _min = 0, _hours = 0;
  Timer? _timer;

  void startStop() {
    if (value.started) {
      _stop();
    } else {
      _start();
    }
  }

  void _start() {
    value = StopwatchState(
      hours: value.hours,
      minutes: value.minutes,
      seconds: value.seconds,
      started: true,
      laps: value.laps,
    );

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _ssec++;
      if (_ssec >= 60) {
        _ssec = 0;
        _min++;
      }
      if (_min >= 60) {
        _min = 0;
        _hours++;
      }

      final digitSec = _ssec >= 10 ? '$_ssec' : '0$_ssec';
      final digitMin = _min >= 10 ? '$_min' : '0$_min';
      final digitHours = _hours >= 10 ? '$_hours' : '0$_hours';

      value = StopwatchState(
        hours: digitHours,
        minutes: digitMin,
        seconds: digitSec,
        started: true,
        laps: value.laps,
      );
    });
  }

  void _stop() {
    _timer?.cancel();
    value = StopwatchState(
      hours: value.hours,
      minutes: value.minutes,
      seconds: value.seconds,
      started: false,
      laps: value.laps,
    );
  }

  void reset() {
    _timer?.cancel();
    _ssec = 0;
    _min = 0;
    _hours = 0;
    value = StopwatchState(
      hours: '00',
      minutes: '00',
      seconds: '00',
      started: false,
      laps: [],
    );
  }

  void addLap() {
    final lap = '${value.hours}:${value.minutes}:${value.seconds}';
    value = StopwatchState(
      hours: value.hours,
      minutes: value.minutes,
      seconds: value.seconds,
      started: value.started,
      laps: List.from(value.laps)..add(lap),
    );
  }

  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
