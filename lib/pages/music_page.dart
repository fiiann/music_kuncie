import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuncie/controller/musicdata_c.dart';
import 'package:musickuncie/pages/component/control_button.dart';
import 'package:musickuncie/pages/component/search.dart';
import 'package:musickuncie/pages/component/song_list.dart';
import 'package:musickuncie/pages/widget/custom_indicator.dart';

import '../controller/audio_c.dart';

class MusicPage extends StatelessWidget {
  MusicPage({Key? key}) : super(key: key);
  final musicC = Get.find<MusicController>();
  final controlC = Get.find<AudioController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
    );
  }

  Widget content(BuildContext context){
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SearchHeader(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx((){
                          if(musicC.isLoading.value){
                            return const CustomLoadingIndicator();
                          }
                          else{
                            return SongList();
                          }
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(() {
          if(controlC.isPlaying.value){
            return ControlButton();
          }else{
            return Container();
          }
        })
      ],
    );
  }
}
