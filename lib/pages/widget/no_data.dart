import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/custom_style.dart';

class NoData extends StatelessWidget {
  final Widget? optionalWidgetBottom;
  final String? teks;
  const NoData({Key? key, this.optionalWidgetBottom, this.teks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Image.asset('assets/music_image.png'),
          ),
          const SizedBox(height: 8,),
          Text(teks!, style: GoogleFonts.ubuntu(
              fontSize: CustomStyle.fontSizeNormal,
              fontWeight: FontWeight.w700,
              color: CustomStyle.mainColor
          )),
          optionalWidgetBottom??Container()
        ],
      ),
    );
  }
}
