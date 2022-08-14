import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  // AuthController(this.isLoading);

  final authRepository = AuthRepository();

  Future<void> signIn({
    required String email,
    required password,
  }) async {
    isLoading.value = true;

    await authRepository.signIn(email: email, password: password);

    isLoading.value = false;
  }
}
