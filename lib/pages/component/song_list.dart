import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuncie/const/custom_style.dart';
import 'package:musickuncie/controller/musicdata_c.dart';
import 'package:musickuncie/pages/component/song_card.dart';
import 'package:musickuncie/pages/widget/no_data.dart';

class SongList extends StatelessWidget {
  SongList({Key? key}) : super(key: key);
  final musicC = Get.find<MusicController>();

  @override
  Widget build(BuildContext context) {
    if(musicC.modelMusic.value.resultCount == 0){
      return NoData(teks: musicC.keyword.value==''?'Search your favourite song':'Song not found');
    }else{
      return Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index){
            return Divider(thickness: 0, color: CustomStyle.mainColor,);
          },
          itemCount: musicC.modelMusic.value.resultCount!,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index){
            return SongCard(musicC.modelMusic.value.results![index]);
          },
        ),
      );
    }
  }
}
