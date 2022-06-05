import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuncie/controller/audio_c.dart';
import 'package:musickuncie/model/music_model.dart';

import '../../const/custom_style.dart';

class SongCard extends StatelessWidget {
  final Song song;
  SongCard(this.song, {Key? key}) : super(key: key);
  final audioC = Get.find<AudioController>();
  @override
  Widget build(BuildContext context) {

    return Obx(
       () {
        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          tileColor: audioC.song.value == song?Colors.black12:Colors.transparent,
          onTap: () {
            audioC.selectSong(song);
          },
          leading: Container(
            height : MediaQuery.of(context).size.width/8,
            width : MediaQuery.of(context).size.width/8,
            decoration: BoxDecoration(
              border: Border.all(
                color: CustomStyle.mainColor,
                width: 2
              )
            ),
            child: Image.network(song.artworkUrl100!),
          ),
          title: Obx(() {
            return Text(song.trackName??'', style: TextStyle(color: audioC.song.value == song?CustomStyle.mainColor:Colors.black),);
          }),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(song.artistName??'', maxLines: 1,),
              Text(song.collectionName??'',maxLines: 1,),
            ],
          ),
          isThreeLine: true,
          trailing: Obx((){
            if(audioC.song.value == song){
              return Image.asset(
                "assets/equalizer.gif",
                fit: BoxFit.fitWidth,
                cacheWidth: 106,
                cacheHeight: 168,
              );
            }else{
              return const SizedBox(height: 5,width: 5,);
            }
          }),
        );
      }
    );
  }
}
