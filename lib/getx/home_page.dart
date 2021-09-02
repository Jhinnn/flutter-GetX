import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/route_config.dart';
import '../../test_page.dart';

import 'add_controller.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    AddController logic = Get.put(AddController());

    return Scaffold(
        appBar: AppBar(
          title: Text('GetX Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _getXState(logic),
              _getXStateButton(logic),
              _getXNavigator(),
            ],
          ),
        ));
  }

  _getXState(logic) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///1.Getx 状态管理简单使用（局部刷新，添加id加以区别）
          GetBuilder<AddController>(
              id: 'count',
              builder: (logic) {
                return Text('数量：${logic.counter}');
              }),
          GetBuilder<AddController>(
              id: 'name',
              builder: (logic) {
                return Text('名称：${logic.username}');
              }),

          ///2.Getx 响应式刷新两种方式Obx，GetX
          Obx(() => Text('数字1:${logic.count1.toString()}')),
          GetX<AddController>(builder: (_) {
            return Text('数字2:${_.count2}');
          }),
          Obx(() => Text('总计：${Get.find<AddController>().sum}')),
        ],
      );

  _getXStateButton(AddController logic) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () => logic.increment(), child: Text('数量+1')),
          ElevatedButton(
              onPressed: () => logic.changeName(), child: Text('名称拼接')),
          ElevatedButton(
              onPressed: () => logic.increase(), child: Text('数字1++')),
          ElevatedButton(
              onPressed: () => logic.increase2(), child: Text('数字2++')),
          Divider(
            color: Colors.red,
            indent: 20,
            thickness: 2,
            height: 10,
          )
        ],
      );

  _getXNavigator() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteConfig.testPage);
              },
              child: Text('getx 命名路由导航')),
          ElevatedButton(
              onPressed: () {
                Get.to(TestPage());
              },
              child: Text('getx 默认导航')),
        ],
      );
}
