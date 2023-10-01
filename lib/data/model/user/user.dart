import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_cart/data/model/user/organizationRoles.dart';
import 'package:flutter_shopping_cart/data/model/user/role.dart';
import 'package:flutter_shopping_cart/data/model/user/userOrganizationRole.dart';

class User extends Equatable {
  User({required this.id, required this.username, required this.avatar, required this.fullname, required this.locked, required this.isDelete, required this.roles, required this.organizationRoles, required this.userOrganizationRole});

  final int id;
  final String username;
  final String avatar;
  final String fullname;
  final bool locked;
  final int isDelete;
  final List<Role> roles;
  final List<OrganizationRoles> organizationRoles;
  final UserOrganizationRole userOrganizationRole;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      avatar: json['avatar'] as String,
      fullname: json['fullname'] as String,
      locked: json['locked'] as bool,
      isDelete: json['isDelete'] as int,
      roles: (json['roles'] as List<dynamic>).cast<Map<String, dynamic>>().map((roleJson) => Role.fromJson(roleJson)).toList(),
      organizationRoles: (json['organizationRoles'] as List<dynamic>).cast<Map<String, dynamic>>().map((orgRoleJson) => OrganizationRoles.fromJson(orgRoleJson)).toList(),
      userOrganizationRole: UserOrganizationRole.fromJson(json['userOrganizationRole'] as Map<String, dynamic>)
    );
  }

  @override
  List<Object?> get props => [
        id,
        username,
        avatar,
        fullname,
        locked,
        isDelete,
        roles,
        organizationRoles,
        userOrganizationRole
      ];
}
