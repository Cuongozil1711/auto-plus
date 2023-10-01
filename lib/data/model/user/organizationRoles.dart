
import 'package:equatable/equatable.dart';

class OrganizationRoles extends Equatable {
  OrganizationRoles({required this.organizationName, required this.organizationId, required this.roleName, required this.roleId, required this.isDefault});

  final String organizationName;
  final int organizationId;
  final String roleName;
  final int roleId;
  final int isDefault;

  factory OrganizationRoles.fromJson(Map<String, dynamic> json) {
    return OrganizationRoles(
      organizationName: json['organizationName'] as String,
      organizationId: json['organizationId'] as int,
      roleName: json['roleName'] as String,
      roleId: json['roleId'] as int,
      isDefault: json['isDefault'] as int
    );
  }

  @override
  List<Object?> get props => throw [organizationName, organizationId, roleName, roleId, isDefault];
}