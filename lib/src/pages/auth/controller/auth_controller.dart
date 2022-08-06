import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  // AuthController(this.isLoading);

  Future<void> signIn({
    required String email,
    required password,
  }) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
  }
}
