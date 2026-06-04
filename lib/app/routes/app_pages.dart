import 'package:get/get.dart';

import '../modules/firstPage/bindings/first_page_binding.dart';
import '../modules/firstPage/views/first_page_view.dart';
import '../modules/secondPage/bindings/second_page_binding.dart';
import '../modules/secondPage/views/second_page_view.dart';
import '../modules/thirdPage/bindings/third_page_binding.dart';
import '../modules/thirdPage/views/third_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FIRST_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.FIRST_PAGE,
      page: () => const FirstPageView(),
      binding: FirstPageBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.SECOND_PAGE,
      page: () => const SecondPageView(),
      binding: SecondPageBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.THIRD_PAGE,
      page: () => const ThirdPageView(),
      binding: ThirdPageBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
