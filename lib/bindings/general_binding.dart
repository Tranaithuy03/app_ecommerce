import 'package:app_my_pham/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());//khai báo các controller, services hoặc models mà màn hình sẽ cần một cách tự động
  }

}