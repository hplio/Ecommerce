import 'package:get/get.dart';
import 'package:to_do/network/network_manager.dart';

class GenralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
