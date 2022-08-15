import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();
  Future signIn({
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
      print('Signin funcionou');
      final user = UserModel.fromJson(result['result']);
      print('result[message]: ${result['message']}');
      print('result[error]: ${result['error']}');
      print('result[code]: ${result['code']}');
      print('result[result]: ${result['result']}');
      print('result: $result');
      print('user: $user');
    } else {
      print('Signin NÃO funcionou');
      print(result['message']);
      print(result['error']);
      print(result['code']);
      print(result);
    }
  }
}
