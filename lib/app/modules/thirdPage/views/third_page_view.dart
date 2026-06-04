import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test/app/modules/widgets/custome_app_bar.dart';
import 'package:technical_test/app/modules/widgets/shimer.dart';

import '../controllers/third_page_controller.dart';

class ThirdPageView extends GetView<ThirdPageController> {
  const ThirdPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(title: "Third Screen"),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchUsers(isRefresh: true),
        color: const Color(0xff2B3E5C),
        child: Obx(() {
          if (controller.isLoading.value) {
            return ListView.builder(
              itemCount: 6,
              padding: const EdgeInsets.all(16),
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildSkeletonItem(),
            );
          }

          if (controller.isError) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Failed to load users",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff686777),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => controller.fetchUsers(isRefresh: true),
                          child: const Text("Retry"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          if (controller.users.isEmpty) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(
                    child: Text(
                      "No users found.",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff686777),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          final displayCount = controller.users.length +
              (controller.isMoreLoading.value ? 1 : 0);

          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent - 200) {
                controller.fetchUsers();
              }
              return true;
            },
            child: ListView.builder(
              itemCount: displayCount,
              padding: const EdgeInsets.all(16),
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == controller.users.length) {
                  return _buildSkeletonItem();
                }

                final data = controller.users[index];
                return InkWell(
                  onTap: () => controller.handleChooseUser(data),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Color(0xffE2E3E4),
                        ),
                      ),
                    ),
                    child: Row(
                      spacing: 16,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(25),
                          child: Image.network(
                            data.avatar,
                            width: 49,
                            height: 49,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: 49,
                              height: 49,
                              color: Colors.grey[300],
                              child: const Icon(Icons.person, color: Colors.grey),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            spacing: 2.5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data.firstName} ${data.lastName}",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff04021D),
                                ),
                              ),
                              Text(
                                data.email,
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff686777),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSkeletonItem() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xffE2E3E4),
          ),
        ),
      ),
      child: Row(
        spacing: 16,
        children: [
          const Shimer(width: 49, height: 49, borderRadius: 25),
          Expanded(
            child: Column(
              spacing: 6.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Shimer(width: 120, height: 16, borderRadius: 4),
                Shimer(width: 180, height: 10, borderRadius: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
