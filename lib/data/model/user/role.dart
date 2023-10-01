import 'package:equatable/equatable.dart';

class Role extends Equatable {
  final int roleId;
  final String roleName;
  final String roleCode;
  final int active;

 factory Role.fromJson(Map<String, dynamic> json){
   return Role(
       roleId: json['roleId'] as int,
       roleName: json['roleName'] as String,
       roleCode: json['roleCode'] as String,
       active: json['active'] as int
   );
 }

  Role({required this.roleId, required this.roleName, required this.roleCode, required this.active});

  @override
  List<Object?> get props => throw [roleId, roleName, roleCode, active];
}