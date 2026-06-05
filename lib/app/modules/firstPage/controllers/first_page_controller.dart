import 'package:flutter/material.dart';
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
    await Future.delayed(const Duration(milliseconds: 500));
    final sentence = palindromController.text;
    final cleanSentence = sentence.trim().toLowerCase();
    final isPalindrome =
        cleanSentence.isNotEmpty &&
        cleanSentence == cleanSentence.split("").reversed.join("");

    Get.snackbar(
      "Palindrome Result",
      isPalindrome ? "isPalindrome" : "not palindrome",
      snackPosition: SnackPosition.TOP,
      backgroundColor: isPalindrome
          ? const Color(0xff2E7D32)
          : const Color(0xffC62828),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: Icon(
        isPalindrome ? Icons.check_circle_outline : Icons.error_outline,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 3),
      boxShadows: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    );
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    palindromController.dispose();
  }
}
