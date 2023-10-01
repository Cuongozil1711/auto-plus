import 'package:equatable/equatable.dart';

class UserDTO extends Equatable {
  final String username, password;

  UserDTO({
    required this.username,
    required this.password
  });

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'password': this.password,
    };
  }

  @override
  List<Object?> get props => [username, password];
}
