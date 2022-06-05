import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuncie/model/music_model.dart';
import 'package:musickuncie/service/music_api.dart';

class MusicController extends GetxController with WidgetsBindingObserver{
  var isLoading = false.obs;
  var modelMusic = MusicModel(resultCount: 0, results: []).obs;
  var keyword = ''.obs;
  @override
  void onInit() {
    print("init");
    initData('');
    debounce(keyword, (_) => initData(keyword.value));
  }

  void initData(String keyword) async{
    isLoading.value = true;
    modelMusic.value = await getMusicData(keyword);
    isLoading.value = false;
  }

  void searchSong(String keywordText)async{
    keyword.value = keywordText;
  }

  Future<MusicModel> getMusicData(String keyword) async {
    MusicModel musicData = await MusicApi().getMusic(keyword);
    return musicData;
  }
}