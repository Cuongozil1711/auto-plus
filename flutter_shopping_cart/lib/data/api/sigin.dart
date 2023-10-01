import 'package:flutter_shopping_cart/data/api/api_client.dart';
import 'package:flutter_shopping_cart/data/dto/userDTO.dart';
import 'package:flutter_shopping_cart/data/model/user/userToken.dart';
import 'package:flutter_shopping_cart/data/shared_preferences/token_manager.dart';
import 'package:flutter_shopping_cart/data/shared_preferences/user_token_manager.dart';


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
