import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation_new/home.dart';
import 'package:translation_new/translation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.yellow,
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      home: InputPage(),
    );
  }
}
