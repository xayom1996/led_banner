import 'package:get/get.dart';
import 'package:led_banner/controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController(), tag: 'dashboard');
  }
}