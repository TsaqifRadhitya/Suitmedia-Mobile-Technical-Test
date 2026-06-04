import 'package:get/get.dart';
import 'package:technical_test/app/data/entity/user.dart';
import 'package:technical_test/app/data/response/user_response.dart';
import 'package:technical_test/app/data/services/api_service.dart';

class ThirdPageController extends GetxController {
  final isLoading = false.obs;
  final isMoreLoading = false.obs;
  final hasMore = true.obs;
  final users = <User>[].obs;
  final data = Rxn<UserResponse>();
  bool get isError => !isLoading.value && data.value == null && users.isEmpty;
  final apiService = Get.find<ApiService>();

  int currentPage = 1;

  @override
  void onInit() {
    super.onInit();
    fetchUsers(isRefresh: true);
  }

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      hasMore.value = true;
      users.clear();
      data.value = null;
    }

    if (!hasMore.value) return;

    if (isRefresh) {
      isLoading.value = true;
    } else {
      if (isMoreLoading.value) return;
      isMoreLoading.value = true;
    }

    try {
      final response = await apiService.get(
        "/api/users",
        queryParameters: {"page": currentPage, "per_page": 10},
      );
      final userResponse = UserResponse.fromJson(response.data);
      data.value = userResponse;
      users.addAll(userResponse.data);

      if (userResponse.page >= userResponse.totalPages ||
          userResponse.data.isEmpty) {
        hasMore.value = false;
      } else {
        currentPage++;
      }
    } catch (e) {
      if (isRefresh) {
        data.value = null;
      }
    } finally {
      if (isRefresh) {
        isLoading.value = false;
      } else {
        isMoreLoading.value = false;
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void handleChooseUser(User user) {
    Get.back(result: "${user.firstName} ${user.lastName}");
  }
}
