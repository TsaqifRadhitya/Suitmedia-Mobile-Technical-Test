import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/routes/app_pages.dart';

enum Field { name, palindrom }

class FirstPageController extends GetxController {
  late final TextEditingController nameController;
  late final TextEditingController palindromController;
  final formKey = GlobalKey<FormState>();

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

  FormFieldValidator<String?> validator(Field filed) {
    switch (filed) {
      case Field.name:
        return (value) {
          return "";
        };
      case Field.palindrom:
        return (value) {
          return "";
        };
    }
  }

  void handleNext() {
    Get.toNamed(Routes.SECOND_PAGE, parameters: {'name': nameController.text});
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    palindromController.dispose();
  }
}
