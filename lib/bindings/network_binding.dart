import 'package:get/get.dart';
import 'package:quick_ledger/utils/helpers/network_manager.dart';

class NetworkBinding with Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}