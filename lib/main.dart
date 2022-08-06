import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages_routes/app_pages.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // todo quando showSemanticsDebugger true, ele mostra o esqueleto do app
      // showSemanticsDebugger: true,
      debugShowCheckedModeBanner: false,
      title: 'GreenGrocer',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      getPages: AppPages.pages,
      initialRoute: PagesRoutes.splashRoutes,
    );
  }
}
