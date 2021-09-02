import 'package:get/get.dart';
import '../getx/home_page.dart';
import '../test_page.dart';

class RouteConfig {
  static final String main = '/';

  static final String testPage = '/testPage';

  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => MyHomePage()),
    GetPage(name: testPage, page: () => TestPage()),
  ];
}
