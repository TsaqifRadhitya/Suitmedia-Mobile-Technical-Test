import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:technical_test/app/modules/widgets/custome_app_bar.dart';

import '../controllers/third_page_controller.dart';

class ThirdPageView extends GetView<ThirdPageController> {
  const ThirdPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(title: "Third Screen"),
      // body: ListView.builder(itemBuilder: itemBuilder)
    );
  }
}
