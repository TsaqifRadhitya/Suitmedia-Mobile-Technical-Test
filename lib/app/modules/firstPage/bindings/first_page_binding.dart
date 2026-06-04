import 'package:get/get.dart';
import 'package:technical_test/app/data/services/api_service.dart';

import '../controllers/first_page_controller.dart';

class FirstPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstPageController>(() => FirstPageController());
    Get.lazyPut<ApiService>(() => ApiService());
  }
}
