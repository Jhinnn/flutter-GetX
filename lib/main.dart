import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/getx/add_controller.dart';
import 'package:getx_demo/route_config.dart';
import 'package:getx_demo/test_page.dart';

import 'getx/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: RouteConfig.getPages,
      home: MyHomePage(),
    );
  }
}
