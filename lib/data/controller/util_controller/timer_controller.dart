import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  var isTimer = false.obs;
  RxInt remainingSeconds = 180.obs; // 3분(180초)
  Timer? timer;

  void startTimer() {
    isTimer.value = true;
    remainingSeconds.value = 180; // 타이머 초기화 (3분)
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        t.cancel();
        isTimer.value = false;
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
    isTimer.value = false;
  }

  void resetTimer() {
    stopTimer();
    remainingSeconds.value = 180;
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }
}
