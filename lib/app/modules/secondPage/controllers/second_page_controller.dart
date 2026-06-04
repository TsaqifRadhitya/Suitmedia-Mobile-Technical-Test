import 'package:get/get.dart';
import 'package:technical_test/app/routes/app_pages.dart';

class SecondPageController extends GetxController {
  final name = "".obs;
  final selectedUser = RxnString();

  @override
  void onInit() {
    super.onInit();
    name.value = Get.parameters['name'] ?? "";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void handleAChooseUser() async {
    final result = await Get.toNamed(Routes.THIRD_PAGE);
    if (result != null) {
      selectedUser.value = result;
    }
  }
}
