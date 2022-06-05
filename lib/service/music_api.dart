import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:musickuncie/model/music_model.dart';
import 'package:musickuncie/service/api.dart';

class MusicApi extends GetConnect{
  MusicApi(){
    httpClient.timeout = const Duration(seconds: 20);
  }

  Future<MusicModel> getMusic(String keyword) async{
    final response = await get('${Api.apiHost}search?term=$keyword');
    if (kDebugMode) {
      // print("RESPONSE ${response.body}");
    }
    if(response.status.hasError){
      return Future.error(response.statusText!);
    } else {
      return musicModelFromJson(response.body);
    }
  }
}