import 'package:auto_plus/data/api/api_client.dart';
import 'package:auto_plus/data/dto/userDTO.dart';
import 'package:auto_plus/data/model/user/userToken.dart';
import 'package:auto_plus/data/shared_preferences/token_manager.dart';
import 'package:auto_plus/data/shared_preferences/user_token_manager.dart';


Future<void> loginApi(UserDTO userDTO, Function(int status, String res) param1) async {
  print(userDTO.toMap());

  final response = await apiClient.post('/auth/login', userDTO.toMap());

  final userToken = UserToken.parseToken(response.toString());
  if(userToken != null) {
    await TokenManager.saveToken(userToken.accessToken);
    await UserTokenManager.saveUserToken(response.toString());
    param1(200, userToken.accessToken);
  }
}
