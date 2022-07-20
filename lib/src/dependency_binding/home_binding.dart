import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../services/home_service_impl.dart';

///define binding
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeserviceImpl());
    Get.put(GitController());
  }
}
