import 'package:get/get.dart';

class AddController extends GetxController {
  var count1 = 0.obs;
  var count2 = 0.obs;

  var count3 = RxInt(0);
  var isLogin = RxBool(false);
  var items = RxList<String>([]);
  int _count = 0;
  int get counter => _count;

  String _name = 'Lili';
  String get username => _name;

  increment() {
    _count++;
    update(['count']);
  }

  changeName() {
    _name = _name + ':' + 'boby';
    update(['name']);
  }

  int get sum => count1.value + count2.value;
  increase() => ++count1;
  increase2() => ++count2;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    /// 每次更改都会回调
    ever(count1, (_) => print("$_ has been changed"));

    /// 第一次更改回调
    once(count1, (_) => print("$_ was changed once"));

    /// 更改后3秒回调
    debounce(count1, (_) => print("debouce$_"), time: Duration(seconds: 3));

    ///3秒内更新回调一次
    interval(count1, (_) => print("interval $_"), time: Duration(seconds: 3));
  }
}
