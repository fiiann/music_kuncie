import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuncie/controller/musicdata_c.dart';
import '../widget/template_form.dart';

class SearchHeader extends StatelessWidget {
  SearchHeader({Key? key}) : super(key: key);
  TextEditingController keyword = TextEditingController();
  final c = Get.find<MusicController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
      child: Container(
        margin: const EdgeInsets.only(top: 42),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: TemplateForm(
              controller: keyword,
              onChanged: (value)=> c.searchSong(value),
              prefixIcon: const Icon(Icons.search_rounded),
              color: Colors.black,
              fillColor: Colors.grey[200],
              borderColor: Colors.transparent,
              hintText: "Search Artist, Track Song, etc",
              radius: 6,))
          ],
        ),
      ),
    );
  }
}
