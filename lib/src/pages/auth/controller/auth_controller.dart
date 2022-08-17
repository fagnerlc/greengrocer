import 'package:get/get.dart';
import 'package:greengrocer/src/constants/storage_keys.dart';
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

  @override
  void onInit() {
    super.onInit();
    validatorToken();
  }

  Future<void> validatorToken() async {
    // Recuperar o token que foi salvo localmente
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoutes);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);
    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        signOut();
      },
    );
  }

  void signOut() async {
    // zerar o user
    user = UserModel();

    // remover o token localmente
    await utilsServices.removeLocalData(key: StorageKeys.token);

    // Ir para o login
    Get.offAllNamed(PagesRoutes.signInRoutes);
  }

  void saveTokenAndProceedToBase() {
    // Salvar o token
    utilsServices.saveLovalData(key: StorageKeys.token, data: user.token!);
    // Ir para a base
    Get.offAllNamed(PagesRoutes.baseRoutes);
  }

  Future<void> signUp() async {
    isLoading.value = true;
    AuthResult result = await authRepository.signUp(user);
    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
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
        saveTokenAndProceedToBase();

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
