import 'dart:async';

import 'package:get/state_manager.dart';

class TimeController extends GetxController {

  Timer timer;
  var now = DateTime.now().obs;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
            now.value = now.value.add(new Duration(seconds: 1));
          }
    );
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    startTimer();
  }
}