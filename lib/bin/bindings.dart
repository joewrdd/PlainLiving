import 'package:get/get.dart';
import 'package:plainliving/utils/helpers/network.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
