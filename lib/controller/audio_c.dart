import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musickuncie/model/music_model.dart';

class AudioController extends GetxController{
  var song = Song().obs;
  var player = AudioPlayer().obs;
  var isPlaying = false.obs;


  // AudioController(this.song, this.player, this.isPlaying);

  void selectSong(Song songSelected){
    song.value = songSelected;
  }

  void setIsPlaying(){
    if(player.value.playing){
      isPlaying.value = true;
    }else{
      isPlaying.value = false;
    }
  }

  void playSong(){
    player.value.setUrl(song.value.previewUrl!);
    player.value.play();
  }

  @override
  void onInit() {
    ever(song, (_){
      print("play ${song.value.trackName}");
      playSong();
      setIsPlaying();

    });
    super.onInit();
  }

}