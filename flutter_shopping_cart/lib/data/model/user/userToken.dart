import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_cart/data/model/user/user.dart';

class UserToken extends Equatable {

  factory UserToken.fromJson(Map<String, dynamic> json){
    return UserToken(
        accessToken: json['accessToken'] as String,
        tokenType: json['tokenType'] as String,
        user: User.fromJson(json['user'] as Map<String, dynamic>),
        refreshToken: json['refreshToken'] as String
    );
  }
  UserToken({required this.accessToken, required this.tokenType, required this.user, required this.refreshToken});

  final String accessToken;
  final String tokenType;
  final User user;
  final String refreshToken;

  static UserToken? parseToken(String responseBody){
    final parse = json.decode(responseBody);
    print('parse: ' + responseBody);
    if (parse is Map<String, dynamic>) return UserToken.fromJson(parse);
    return null;
  }


  @override
  List<Object?> get props => [accessToken, tokenType, user, refreshToken];
}
