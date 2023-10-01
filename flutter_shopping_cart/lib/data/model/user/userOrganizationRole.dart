import 'package:equatable/equatable.dart';

class UserOrganizationRole extends Equatable {
  UserOrganizationRole({required this.id, required this.userId, required this.userFullName, required this.organizationId, required this.organizationName, required this.roleId, required this.roleName, required this.positionId, required this.positionName, required this.isDelete, required this.isDefault});

  final int id;
  final int userId;
  final String userFullName;
  final int organizationId;
  final String organizationName;
  final int roleId;
  final String roleName;
  final int positionId;
  final String positionName;
  final int isDelete;
  final int isDefault;

  factory UserOrganizationRole.fromJson(Map<String, dynamic> json) {
    return UserOrganizationRole(
      id: json['id'] as int,
      userId: json['userId'] as int,
      userFullName: json['userFullName'] as String,
      organizationId: json['organizationId'] as int,
      organizationName: json['organizationName'] as String,
      roleId: json['roleId'] as int,
      roleName: json['roleName'] as String,
      positionId: json['positionId'] as int,
      positionName: json['positionName'] as String,
      isDelete: json['isDelete'] as int,
      isDefault: json['isDefault'] as int,
    );
  }


  @override
  List<Object?> get props => [
        id,
        userId,
        userFullName,
        organizationId,
        organizationName,
        roleId,
        roleName,
        positionId,
        positionName,
        isDelete,
        isDefault
      ];
}
