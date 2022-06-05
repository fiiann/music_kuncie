import 'package:get/get.dart';
import 'package:musickuncie/controller/audio_c.dart';
import 'package:musickuncie/controller/musicdata_c.dart';

class MusicB implements Bindings {
  @override
  void dependencies() {
    Get.put(MusicController());
    Get.put(AudioController());
  }
}