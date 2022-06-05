import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuncie/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Kuncie',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      getPages: AppPages.pages,
      initialRoute: '/music',
    );
  }
}