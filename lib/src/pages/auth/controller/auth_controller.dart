import 'package:get/get.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/pages_routes/app_pages.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  // AuthController(this.isLoading);

  final authRepository = AuthRepository();
  final UtilsServices utilsServices = UtilsServices();

  UserModel user = UserModel();

  Future<void> validatorToken() async {
    //todo Recuperar o token que foi salvo localmente
    // authRepository.validateToken(token);
  }

  Future<void> signIn({
    required String email,
    required password,
  }) async {
    isLoading.value = true;

    AuthResult result = await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        Get.offAllNamed(PagesRoutes.baseRoutes);

        print('AQUI: user $user');
      },
      error: (message) {
        print('AQUI: message $message');
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
