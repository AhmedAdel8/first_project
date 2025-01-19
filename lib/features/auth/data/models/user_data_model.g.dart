// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      message: json['message'] as String?,
      authorization: json['authorization'] == null
          ? null
          : Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>),
      userData: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'authorization': instance.authorization,
      'result': instance.userData,
    };

Authorization _$AuthorizationFromJson(Map<String, dynamic> json) =>
    Authorization(
      token: json['token'] as String?,
    );

Map<String, dynamic> _$AuthorizationToJson(Authorization instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      userId: json['_id'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      role: json['role'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      isBlocked: json['isBlocked'] as bool?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      '_id': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'isDeleted': instance.isDeleted,
      'isBlocked': instance.isBlocked,
    };
