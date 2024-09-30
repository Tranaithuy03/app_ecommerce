import 'dart:async';

import 'package:app_my_pham/common/widgets/loaders.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController{
  static NetworkManager get instance => Get.find();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _subscription; //đăng ký vào 1 stream đ nhận sự kiện, theo dõi trạng thái kết nối mạng của thiết bị
  final RxList<ConnectivityResult> _connectionStatus = <ConnectivityResult>[].obs;// none: khong co ket noi mang
  @override
  void onInit() {
    super.onInit();
    _subscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus.value= result;
    if(_connectionStatus.contains(ConnectivityResult.none))
      {
        MPLoaders.warningSnackBar(title: 'No Internet Connection');
      }
  }
  /// Check the internet connection status.
  /// Returns true if connected, false otherwise.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result.any((element) => element == ConnectivityResult.none)) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }
  @override
  void onClose() {
    super.onClose();
    _subscription.cancel();
  }
}