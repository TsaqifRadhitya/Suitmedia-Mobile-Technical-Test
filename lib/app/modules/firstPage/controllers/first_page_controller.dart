import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/routes/app_pages.dart';

class FirstPageController extends GetxController {
  late final TextEditingController nameController;
  late final TextEditingController palindromController;
  final formKey = GlobalKey<FormState>();
  final isPalindromFiledEmpty = false.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    palindromController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void handleNext() {
    if (!(formKey.currentState?.validate() == true)) return;
    print("Nama : ${nameController.text}");
    Get.toNamed(Routes.SECOND_PAGE, parameters: {'name': nameController.text});
  }

  void handlePalindorm() async {
    isLoading.value = true;
    isPalindromFiledEmpty.value = false;
    if (palindromController.text.trim().isEmpty) {
      isPalindromFiledEmpty.value = true;
      isLoading.value = false;
      return;
    }
    await Future.delayed(Duration(microseconds: 500));
    final sectence = palindromController.text;
    final palindromResult =
        sectence.trim().toLowerCase() ==
        sectence.trim().toLowerCase().split("").reversed.join("");
    Get.snackbar("Palindrom Result", palindromResult.toString());
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    palindromController.dispose();
  }
}
