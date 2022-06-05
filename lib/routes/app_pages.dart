
import 'package:get/get.dart';
import 'package:musickuncie/binding/musicB.dart';
import 'package:musickuncie/pages/music_page.dart';
import 'package:musickuncie/routes/route_name.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.music,
      page: () => MusicPage(),
      binding: MusicB()
    ),
  ];
}