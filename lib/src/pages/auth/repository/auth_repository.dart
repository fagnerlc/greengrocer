import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_errors.dart' as authErrors;
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();
  Future<AuthResult> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethots.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      print('Signin funcionou');
      print('result[message]: ${result['message']}');
      print('result[error]: ${result['error']}');
      print('result[code]: ${result['code']}');
      print('result[result]: ${result['result']}');
      print('result: $result');
      print('user: $user');
      return AuthResult.success(user);
    } else {
      print('Signin NÃO funcionou');
      print(result['message']);
      print(result['error']);
      print(result['code']);
      print(result);
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }
}
