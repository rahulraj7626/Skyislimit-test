import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/route_manager/route.dart';
import 'src/route_manager/route_pages.dart';

///App start from here
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Skyislimit machine test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      getPages: RoutesPages.routes,
      initialRoute: Routes.getHome(), //initial route
    );
  }
}
