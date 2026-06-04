import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test/app/modules/widgets/custome_app_bar.dart';
import 'package:technical_test/app/modules/widgets/custome_primary_button.dart';

import '../controllers/second_page_controller.dart';

class SecondPageView extends GetView<SecondPageController> {
  const SecondPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(title: "Second Screen"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: GoogleFonts.poppins(
                      color: const Color(0xff04021D),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  Obx(
                    () => Text(
                      controller.name.value,
                      style: GoogleFonts.poppins(
                        color: const Color(0xff04021D),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.selectedUser.value ?? "Selected User Name",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: const Color(0xff04021D),
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              CustomePrimaryButton(
                onPressed: controller.handleAChooseUser,
                label: "Choose a User",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
