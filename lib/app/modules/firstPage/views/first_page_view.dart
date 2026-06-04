import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:technical_test/app/modules/widgets/custome_primary_button.dart';
import 'package:technical_test/app/modules/widgets/custome_text_form_field.dart';

import '../controllers/first_page_controller.dart';

class FirstPageView extends GetView<FirstPageController> {
  const FirstPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteractionIfError,
          child: Column(
            spacing: 48,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/ic_photo.png",
                width: MediaQuery.of(context).size.width / 3,
              ),
              Column(
                spacing: 20,
                children: [
                  CustomeTextFormField(
                    controller: controller.nameController,
                    hintText: "Name",
                    validator: controller.validator(Field.name),
                  ),
                  CustomeTextFormField(
                    controller: controller.palindromController,
                    hintText: "Palindrome",
                    validator: controller.validator(Field.palindrom),
                  ),
                ],
              ),
              Column(
                spacing: 7.5,
                children: [
                  CustomePrimaryButton(
                    onPressed: () {},
                    label: "CHECK",
                    loading: true,
                  ),
                  CustomePrimaryButton(
                    onPressed: controller.handleNext,
                    label: "NEXT",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
